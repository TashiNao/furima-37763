FactoryBot.define do
  factory :user do
    nickname   { 'test3' }
    email      {Faker::Internet.free_email}
    password   { '1234aaa' }
    password_confirmation { '1234aaa' }
    last_name          { '手巣都' }
    last_name_kana     { 'テスト' }
    first_name         { '太郎' }
    first_name_kana    { 'タロウ' }
    birth { '2000-01-01' }
  end
end
