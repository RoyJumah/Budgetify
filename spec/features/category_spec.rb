require 'rails_helper'

RSpec.feature 'Category', type: :feature do
  before(:each) do
    @user = User.new(name: 'test', email: 'test04@gmail.com', password: '123456', password_confirmation: '123456')
    @user.save

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'should have category page' do
    expect(page).to have_content('Categories')
  end

  it 'should have a new category button' do
    expect(page).to have_content('Add a new category')
  end

  it 'should have a new category form' do
    click_link 'Add a new category'
    expect(page).to have_content('New Category')
  end
end
