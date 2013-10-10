require 'spec_helper'

feature 'Users can edit their own lessons or comments', %Q{
  As a user
  I want edit my own posts
  So that I can correct incorrect information
} do

  # ACCEPTANCE CRITERIA
  #
  # * Student can find a lesson
  # * Student joins the lesson
  # * Student cannot join private lessons
  let!(:lesson) { FactoryGirl.create(:lesson) }
  let!(:teacher) { FactoryGirl.create(:user) }

  scenario 'Teacher edits a lesson' do

    lesson_count = Lesson.count
    lesson.update(teacher_id: teacher.id)

    sign_in(teacher)

    click_on "My Lessons"
    click_on 'Edit lesson'

    fill_in 'Title', with: 'New title'
    fill_in 'Description', with: 'New description'
    click_on 'Confirm edit'
    expect(page).to have_content('New title')
    expect(page).to have_content('New description')
    expect(Lesson.count).to eql(lesson_count)
    expect(page).to have_content('Lesson was successfully updated.')
  end
end
