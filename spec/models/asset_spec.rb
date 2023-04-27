require 'rails_helper'

RSpec.describe Asset, type: :model do
  describe 'associations' do
    it 'belongs_to user' do
      asset = Asset.reflect_on_association(:user)
      expect(asset.macro).to eq(:belongs_to)
    end

    it 'has_many groups' do
      asset = Asset.reflect_on_association(:groups)
      expect(asset.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'John')
    end

    it 'is not valid without a name' do
      asset = Asset.new(name: nil, amount: 100, authorid: @user.id)
      expect(asset).to_not be_valid
    end

    it 'is not valid without an amount' do
      asset = Asset.new(name: 'Entity', amount: nil, authorid: @user.id)
      expect(asset).to_not be_valid
    end

    it 'is not valid without an authorid' do
      asset = Asset.new(name: 'Entity', amount: 100, authorid: nil)
      expect(asset).to_not be_valid
    end
  end
end
