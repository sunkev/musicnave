require 'spec_helper'

feature 'user logs in' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user enters username and password' do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content("Logged in as #{user.username}")
  end

end