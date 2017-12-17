FactoryBot.define do
  factory :ability do
    name Faker::LeagueOfLegends.masteries
    description Faker::RickAndMorty.quote
    is_ultimate false
    trait :with_heroes do
      heroes { create_list :hero, 3}
    end
  end
end
