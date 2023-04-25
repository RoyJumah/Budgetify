require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'associations' do
    it 'belongs_to user' do
      entity = Entity.reflect_on_association(:user)
      expect(entity.macro).to eq(:belongs_to)
    end

    it 'has_many groups' do
      entity = Entity.reflect_on_association(:groups)
      expect(entity.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'John')
    end

    it 'is valid with valid attributes' do
      entity = Entity.new(name: 'Entity', amount: 100, authorid: @user.id)
      expect(entity).to be_valid
    end

    it 'is not valid without a name' do
      entity = Entity.new(name: nil, amount: 100, authorid: @user.id)
      expect(entity).to_not be_valid
    end

    it 'is not valid without an amount' do
      entity = Entity.new(name: 'Entity', amount: nil, authorid: @user.id)
      expect(entity).to_not be_valid
    end

    it 'is not valid without an authorid' do
      entity = Entity.new(name: 'Entity', amount: 100, authorid: nil)
      expect(entity).to_not be_valid
    end
  end
end
