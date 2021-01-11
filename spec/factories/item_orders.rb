FactoryBot.define do
  factory :item_order do
    postal_code { "111-1111" }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { "横浜市緑区" }
    address { "青山1-1-1" }
    building_name { "柳ビル103" }
    tel_number { "0120111111" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
