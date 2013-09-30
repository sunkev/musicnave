require 'spec_helper'

feature 'User creates a lesson', %Q{
  As a teacher
  I want to be able to group all my students together
  So that I can message them all at the same time
} do

# * Acceptence criteria
# * Anyone can make a lesson, which is a group
# * Can invite anyone to the group
# * Has a title, description, create date

let(:user) { FactoryGirl.create(:user) }

  scenario 'User makes a lesson successfully' do

    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit new_lesson_path(:user)
    fill_in 'Title', with: 'Flute Lessons'
    fill_in 'Description', with: 'The best lessons with KSun'
    click_button 'Create Lesson'
    expect(page).to have_content('Lesson successfully created')
  end
end