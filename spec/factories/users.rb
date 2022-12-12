FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    nickname { Faker::Name.name }
    last_name { japanese_user.last.kanji }
    first_name { japanese_user.first.kanji }
    birth_day { Faker::Date.birthday(min_age: 18) }
    last_name_kana { japanese_user.last.katakana }
    first_name_kana { japanese_user.first.katakana }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
  end
end