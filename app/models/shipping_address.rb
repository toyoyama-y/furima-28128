class ShippingAddress < ApplicationRecord
  belongs_to :wallet
  belongs_to :prefecture

end
