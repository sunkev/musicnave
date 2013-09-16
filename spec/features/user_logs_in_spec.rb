require 'spec_helper'

feature 'user logs in' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user enters email and password' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # save_and_open_page
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully.')
  end

end