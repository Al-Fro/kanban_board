FactoryBot.define do
  factory :card do
    title { generate :string }
  end

  trait :with_list do
    association :list, :with_board
  end
end
