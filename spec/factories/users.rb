FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    gimei = Gimei.name
    first_name            { gimei.first.kanji }
    last_name             { gimei.last.kanji }
    first_kana_name       { gimei.first.katakana }
    last_kana_name        { gimei.last.katakana }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
