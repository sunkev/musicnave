require 'spec_helper'

feature 'teacher can change the status of a lesson to private', %Q{
  As a teacher
  I want to change the privacy of my lesson
  So that I keep my comments private
} do

# * Acceptence criteria
# * Teacher can change the lesson type from private and back
# * Lesson type can be changed during and after creating a lesson

  let(:teacher) { FactoryGirl.create(:user) }
  let(:student) { FactoryGirl.create(:user) }

  scenario 'Teacher makes a lesson private at lesson creation' do
    body = 'Flute Lessons'

    sign_in(teacher)
    visit new_lesson_path(:teacher)
    fill_in 'Title', with: body
    fill_in 'Description', with: 'The best lessons with KSun'
    page.check('Private')
    click_button 'Create Lesson'
    expect(page).to have_content('Lesson successfully created')
    sign_out(teacher)

    sign_in(student)
    click_on "Everyone's Lessons!"
    expect(page).to_not have_content(body)
  end

  scenario 'Teacher makes a lesson private after lesson creation' do
    body = 'Flute Lessons'

    sign_in(teacher)
    visit new_lesson_path(:teacher)
    fill_in 'Title', with: body
    fill_in 'Description', with: 'The best lessons with KSun'
    click_button 'Create Lesson'
    expect(page).to have_content('Lesson successfully created')
    click_on "Everyone's Lessons!"
    click_on body
    click_on 'Make private'
    sign_out(teacher)

    sign_in(student)
    click_on "Everyone's Lessons!"
    expect(page).to_not have_content(body)
  end
end