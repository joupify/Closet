class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  monetize :price_cents
  
  has_many :line_items, dependent: :nullify
  belongs_to :user, optional: true
  has_many :orders

end
