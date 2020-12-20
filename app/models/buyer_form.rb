class Buyer
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :telephone

  with_options presence: true do
    validates :postal_code, format: {with: /^\d{3}[-]\d{4}$/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :telephone,  format: {with: /^\d{11}$/, message: "is invalid. Do not include hyphen(-)"}
  end

  def save
    # 購入者情報を保存
    wallet = Wallet.create(user_id: user.id, item_id: item.id)
    # 配送先情報を保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, wallet_id: wallet.id)
  end

end