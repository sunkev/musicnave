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
    click_button 'Sign In'

    visit new_lesson_path(:user)
    fill_in 'Title', with: 'Flute Lessons'
    fill_in 'Description', with: 'The best lessons with KSun'
    fill_in "City", with: "Boston"
    select('Massachusetts', :from => 'State')
    click_button 'Create Lesson'
    expect(page).to have_content('Lesson successfully created')
  end

  scenario 'User does not make a lesson successfully' do

    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit new_lesson_path(:user)
    click_button 'Create Lesson'
    expect(page).to_not have_content('Lesson successfully created')
  end

  scenario 'User cannot make a lesson without authorizing' do

    visit '/'
    expect(page).to_not have_content('Private messages')
  end

  scenario 'comment was cancelled' do

    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_on 'My Lessons'
    click_on 'Make a lesson'
    click_on 'Cancel'
    expect(page).to have_content('Make a lesson')
  end
end