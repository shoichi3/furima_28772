FactoryBot.define do
  factory :user do
    nickname                 { Faker::Name.initials(number: 2) }
    email                    { Faker::Internet.free_email }
    password                 { Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    birth_date               { '2000-01-13' }
    last_name                { '山田' }
    first_name               { '太郎' }
    last_name_kana           { 'ヤマダ' }
    first_name_kana          { 'タロウ' }
  end
end
