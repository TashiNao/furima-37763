FactoryBot.define do
  factory :purchase_address do
    postal { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    telephone { '11122223333' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
