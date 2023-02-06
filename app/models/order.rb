class Order < ApplicationRecord
  enum status: { pending: 0, failed: 1, paid: 2, paypal_executed: 3}
  enum payment_gateway: { stripe: 0, paypal: 1 }
  belongs_to :user 
  belongs_to :product
  has_many :line_items, dependent: :destroy
  scope :recently_created, ->  { where(created_at: 1.minutes.ago..DateTime.now) }

  def set_paid
    self.status = Order.statuses[:paid]
  end
  def set_failed
    self.status = Order.statuses[:failed]
  end
  def set_paypal_executed
    self.status = Order.statuses[:paypal_executed]
  end

  

    def save_with_payment(token)
      customer = Stripe::Customer.create(
        source: token,
        email: self.user.email
      )
  
      Stripe::Charge.create(
        customer: customer.id,
        amount: self.total_price,
        description: "Payment for order #{self.id}",
        currency: 'usd'
      )
  
      self.status = :paid
      self.save
    rescue Stripe::CardError => e
      self.status = :failed
      self.save
      false
    end

end