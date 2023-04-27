require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  before(:each) do
    visit unauthenticated_root_path
  end

  it 'should have a sign up button' do
    expect(page).to have_content('Sign Up')
  end

  it 'should have a sign in button' do
    expect(page).to have_content('Sign In')
  end

  it 'should show the sign in form' do
    click_button 'Sign In'
    expect(page).to have_content('Sign In')
  end

  it 'should show the sign up form' do
    click_button 'Sign Up'
    expect(page).to have_content('Sign Up')
  end
end
