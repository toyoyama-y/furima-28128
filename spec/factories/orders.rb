FactoryBot.define do
  factory :item do
    name {"サンプル"}
    text {"サンプルの説明"}
    category_id {1}
    status_id {1}
    shipping_fee_id {1}
    area_id {1}
    day_id {1}
    price {300}
    association :user

end

# マイグレーションファイルを確認する。