FactoryBot.define do
  factory :hero do
    @name = Faker::RickAndMorty.character
    name @name
    real_name @name
    health 1
    armour 1
    shield 1
    trait :with_abilities do
      abilities { create_list :ability, 3}
    end
  end
end
