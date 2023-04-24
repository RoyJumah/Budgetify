 require 'rails_helper'

RSpec.describe Group, type: :model do

  describe 'associations' do
    it 'has_many entities' do
      group = Group.reflect_on_association(:entities)
      expect(group.macro).to eq(:has_many)
    end

    it 'belongs_to user' do
      group = Group.reflect_on_association(:user)
      expect(group.macro).to eq(:belongs_to)
    end
  end
    describe 'validations' do
      before (:each) do
        @user = User.create(name: 'John')
      end

      it 'is valid with valid attributes' do
        group = Group.new(name: 'Group', user_id: @user.id, icon: 'icon')
        expect(group).to be_valid
      end

      it 'is not valid without a name' do
        group = Group.new(name: nil, user_id: @user.id, icon: 'icon')
        expect(group).to_not be_valid
      end

      it 'is not valid without a user_id' do
        group = Group.new(name: 'Group', user_id: nil, icon: 'icon')
        expect(group).to_not be_valid
      end

      it 'is not valid without an icon' do
        group = Group.new(name: 'Group', user_id: @user.id, icon: nil)
        expect(group).to_not be_valid
      end

  end

end
      