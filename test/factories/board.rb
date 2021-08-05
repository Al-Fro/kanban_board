FactoryBot.define do
  factory :board do
    name { generate :string }
    secure_id { SecureRandom.hex(5) }
  end
end
