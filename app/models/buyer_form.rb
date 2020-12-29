class BuyerForm
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :telephone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :telephone,  format: {with: /\A\d{11}\z/, message: "is invalid. Do not include hyphen(-)"}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: '選択肢を選んでください' }

  def save
    # 購入者情報を保存
    wallet = Wallet.create(user_id: user_id, item_id: item_id)
    # 配送先情報を保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, wallet_id: wallet.id)
  end

end