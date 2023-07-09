class LineItem < ApplicationRecord
  require "active_support"
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true
  


  after_initialize do 
    self.quantity ||= 1
  end
  def total
    product.price.to_i * quantity.to_i
  end
  def subtotal
  end


end
 