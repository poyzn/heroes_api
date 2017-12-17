require 'rails_helper'

RSpec.describe Hero, type: :model do
  it 'is valid' do
    hero = build :hero
    expect(hero).to be_valid
  end
  %w{name real_name}.each do |attr|
    it "is invalid without #{attr.humanize}" do
      hero = build :hero, attr.to_sym => nil
      hero.valid?
      expect(hero.errors[attr.to_sym]).to include 'can\'t be blank'
    end
  end
  %w{health armour shield}.each do |attr|
    it "is invalid without #{attr.humanize}" do
      hero = build :hero, attr.to_sym => nil
      hero.valid?
      expect(hero.errors[attr.to_sym]).to include 'is not a number'
    end
  end
  it 'has many abilities' do
    hero = create :hero, :with_abilities
    expect(hero.abilities.count).to eq 3
  end
end
