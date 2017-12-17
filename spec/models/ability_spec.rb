require 'rails_helper'

RSpec.describe Ability, type: :model do
  it 'is valid' do
    ability = build :ability
    expect(ability).to be_valid
  end
  it 'is invalid without name' do
    ability = build :ability, name: nil
    ability.valid?
    expect(ability.errors[:name]).to include 'can\'t be blank'
  end
  it 'has many heroes' do
    ability = create :ability, :with_heroes
    expect(ability.heroes.count).to eq 3
  end
end
