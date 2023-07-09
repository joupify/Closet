class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  require 'active_support/core_ext/hash/keys'  
 


  def add_product(product)
    item = line_items.find_by(product: product)
    if item
        item.quantity = item.quantity.blank? ? 1 : item.quantity + 1
    else
        item = line_items.new(product: product, quantity: 1)
    end
       item
  end


  def total
    line_items.inject(0) {|sum, item| sum + item.total}
  end

end

