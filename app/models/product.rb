class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploaders :images, ImageUploader

  monetize :price_cents
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true
  has_many :orders

end
