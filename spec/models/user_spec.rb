require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    user = build :user
    expect(user).to be_valid
  end
  %w{email password}.each do |attr|
    it "is invalid without #{attr.humanize}" do
      user = build :user, attr.to_sym => nil
      user.valid?
      expect(user.errors[attr.to_sym]).to include 'can\'t be blank'
    end
  end
end
