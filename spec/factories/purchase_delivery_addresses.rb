FactoryBot.define do
  factory :purchase_delivery_address do
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    token {"tok_abcdefghijk0000000000000000"}
    zipcode {"111-1111"}
    city {"横浜市"}
    region {"その辺"}
    building {"建物"}
    telephone {"00000000000"}
  end
end
