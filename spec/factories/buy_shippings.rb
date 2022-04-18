FactoryBot.define do
  factory :buy_shipping do
    address = Gimei.address
    postcode              { '123-4567' }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    city                  { address.city.to_s }
    block                 { address.town.to_s }
    building              { 'test' }
    tel                   { '09012345678' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
