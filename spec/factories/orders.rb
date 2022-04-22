FactoryBot.define do
  factory :order do
    Customer { nil }
    total { 1 }
    order_date { "2022-04-23" }
  end
end
