require 'spec_helper'

feature 'teacher or student makes a comment', %Q{
  As a teacher
  I want to share my information
  So that I can learn and teach others who need help.
} do

  # ACCEPTANCE CRITERIA
  #
  # * Comment contains username of commentor
  # * Comment contains when it was commentor (how many days ago)
  # * Error if body is blank

let(:user) { FactoryGirl.create(:user) }
let(:lesson) { FactoryGirl.create(:lesson) }

let(:student_user) { FactoryGirl.create(:user) }


  scenario 'successful comment made' do

    lesson.teacher_id = user.id
    body_paragraph = 'junk testing text'

    visit new_user_session_path
    fill_in 'Username', with: student_user.username
    fill_in 'Password', with: student_user.password
    click_button 'Sign in'

    visit lesson_path(lesson.id)
    fill_in "comment_body", with: body_paragraph
    click_button 'Create Comment'

    expect(page).to have_content("Logout")
    expect(page).to have_content(body_paragraph)
    expect(page).to have_content(lesson.title)
    expect(page).to have_content(student_user.username)
    expect(page).to have_content("Successful comment")
  end

  scenario 'unsucessfully comment made' do

    lesson.teacher_id = user.id

    visit new_user_session_path
    fill_in 'Username', with: student_user.username
    fill_in 'Password', with: student_user.password
    click_button 'Sign in'

    visit lesson_path(lesson.id)
    click_button 'Create Comment'

    expect(page).to have_content("Logout")
    expect(page).to have_content(lesson.title)
    expect(page).to have_content("Unsucessful comment")
  end

end
