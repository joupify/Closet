class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable 
 
   has_many :products
   has_many :orders 
   pay_customer default_payment_processor: :stripe
   pay_customer stripe_attributes: :stripe_attributes 
   
   




   def stripe_attributes(pay_customer)
    {
      address: {
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id # or pay_customer.owner_id
      }
    }
  end

  
  
    def pay_should_sync_customer?
      # super will invoke Pay's default (e-mail changed)
      super || self.saved_change_to_id? || self.saved_change_to_name?
    end
    
  

end
