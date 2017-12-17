FactoryBot.define do
  factory :hero_ability do
    association :hero
    association :ability
  end
end
