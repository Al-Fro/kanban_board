FactoryBot.define do
  factory :list do
    title { generate :string }
  end

  trait :with_board do
    association :board
  end
end
