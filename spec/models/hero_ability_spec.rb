require 'rails_helper'

RSpec.describe HeroAbility, type: :model do
  it 'is valid' do
    hero_ability = build :hero_ability
    expect(hero_ability).to be_valid
  end
  %w{hero ability}.each do |attr|
    it "is invalid without #{attr.humanize}" do
      hero_ability = build :hero_ability, attr.to_sym => nil
      hero_ability.valid?
      expect(hero_ability.errors[attr.to_sym]).to include 'must exist'
    end
  end
end
