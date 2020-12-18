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

end