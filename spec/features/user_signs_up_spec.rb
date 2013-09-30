require 'spec_helper'

feature 'user signs up', %Q{
  As a user
  I want to sign in
  So that I can see all the great website content
} do

  # Acceptance Criteria:
  # * If I specify a valid, previously registered email and password,
  # I am Authenticated and I can access to the system
  # If I specify an invalid email and password, I remain unauthenticated
  # If I am already signed in, I can't sign in again

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign up'
    fill_in 'First Name', with: 'Kevin'
    fill_in 'Last Name', with: 'Sun'
    fill_in 'Username', with: 'KSUN'
    fill_in 'Email', with: 'KevinSun@theDev.com'
    fill_in 'user_password', with: 'Password'
    fill_in 'Password Confirmation', with: 'Password'
    click_button 'Sign Up'

    expect(page).to have_content("Successful sign up, have fun!")
    expect(page).to have_content("Logout")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Logout")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign up'
    fill_in 'user_password', with: 'Password'
    fill_in 'Password Confirmation', with: 'Password2'

    click_button 'Sign Up'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Logout")
  end

end

