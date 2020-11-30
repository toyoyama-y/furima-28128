class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :shipping_fee
  belongs_to :status

  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
  validates :image
  validates :name, length: { maximum:40 }
  validates :text, length: { maximum:1000 }
  validates :category_id
  validates :status_id
  validates :shipping_fee_id
  validates :area_id
  validates :day_id
  end

  with_options numericality: { other_than: 0, message: '選択肢を選んでください' } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :area_id
    validates :day_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字のみを使用してください' } do
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

end
