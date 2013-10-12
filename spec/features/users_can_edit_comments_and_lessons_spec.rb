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

  let!(:teacher) { FactoryGirl.create(:user) }
  let!(:student) { FactoryGirl.create(:user) }

  scenario 'Teacher edits a lesson' do
    lesson = FactoryGirl.create(:lesson)
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

  scenario 'User edits a comment'
  #   comment = FactoryGirl.create(:comment)

  #   sign_in(student)
  #   comment.user_id = student.id
  #   comment.save
  #   click_on "Find a Lesson!"
  #   click_on Lesson.last.title

  #   click_on 'Edit comment'

  #   fill_in 'Body', with: 'New body'
  #   click_on 'Confirm edit'
  #   expect(page).to have_content('New body')
  #   expect(page).to have_content('Comment was successfully edited.')
  # end
end
