require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'associations' do
    it 'has_many entities' do
      user = User.reflect_on_association(:entities)
      expect(user.macro).to eq(:has_many)
    end

    it 'has_many groups' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq(:has_many)
    end 
  end

 describe 'validations' do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
end 
end 