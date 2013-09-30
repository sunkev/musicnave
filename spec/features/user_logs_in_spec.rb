require 'spec_helper'

feature 'user logs in', %Q{
  As a registered user
  I want to log on to my account
  So that I can exercises my new found privileges and access the website
} do

  # Acceptance Criteria
  # * The username and email are correct, else error message
  # * Change privilege access from visitor to registered user
  # * Will stay logged in even if changing websites

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user enters valid username and password' do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_content("Logout")
  end

  scenario 'user enters invalid username' do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'bogus password'
    click_button 'Sign in'

    expect(page).to have_content("Sign in")
  end

  scenario 'existing email with wrong password is denied access' do
    visit new_user_session_path

    fill_in 'Username', with: 'bogusname'
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content("Sign in")
  end

end