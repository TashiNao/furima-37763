FactoryBot.define do
  factory :purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }

    association :user
    association :item
  end
end
