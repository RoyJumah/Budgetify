require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has_many assets' do
      user = User.reflect_on_association(:assets)
      expect(user.macro).to eq(:has_many)
    end

    it 'has_many groups' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John', email:'johnexample@gmai.com', password:'123456')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil,email:'johnexample@gmai.com', password:'123456')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'John',email:nil, password:'123456')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'John',email:nil, password:nil)
      expect(user).to_not be_valid
    end 
  end
end
