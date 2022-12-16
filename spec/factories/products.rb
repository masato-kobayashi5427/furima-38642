FactoryBot.define do
  factory :product do
    name {Faker::Lorem.sentence}
    explain {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    state_id {Faker::Number.between(from: 2, to: 7)}
    fee_id {Faker::Number.between(from: 2, to: 3)}
    delivery_time_id {Faker::Number.between(from: 2, to: 4)}
    association :user
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end