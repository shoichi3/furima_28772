FactoryBot.define do
  factory :user do
    nickname                 { Faker::Name.initials(number: 2) }
    email                    { Faker::Internet.free_email }
    password                 { Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    birth_date               { '2000-01-13' }
    first_name               { '山田' }
    last_name                { '太郎' }
    first_name_kana          { 'ヤマダ' }
    last_name_kana           { 'タロウ' }
  end
end
