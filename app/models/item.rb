class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true
end
