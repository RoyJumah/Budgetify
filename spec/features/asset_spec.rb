require 'rails_helper'

RSpec.feature 'Assets', type: :feature do
  before(:each) do
    @user = User.create(name: 'test', email: 'test04@gmail.com', password: '123456', password_confirmation: '123456')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit authenticated_root_path
  end

  scenario 'creating a new category' do
    click_link 'Add a new category'
    expect(page).to have_content('New Category')
    fill_in 'Name', with: 'Food'
    fill_in 'Icon\'s link', with: 'https://example.com/icon.png'
    click_button 'Save'
    expect(page).to have_content('Food')
  end

  scenario 'display the assets form' do
    click_link 'Add a new category'
    expect(page).to have_content('New Category')
    fill_in 'Name', with: 'Food'
    fill_in 'Icon\'s link', with: 'https://example.com/icon.png'
    click_button 'Save'
    click_link 'Food'
    expect(page).to have_content('TRANSACTIONS')
    click_link 'Add new transaction'
    expect(page).to have_content('New asset')
  end
end
