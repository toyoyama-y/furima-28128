FactoryBot.define do
  factory :buyer_form do
    user_id {1}
    item_id {1}
    postal_code {'123-4567'}
    prefecture_id {1}
    city {"横浜市緑区"}
    address {"青山1-1-1"}
    telephone {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    building {"トキワ壮"}

  end
end
