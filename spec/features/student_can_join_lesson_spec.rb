require 'spec_helper'

feature 'Student finds a lesson and joins it', %Q{
  As a student
  I want to join lessons
  So that I can learn
} do

  # ACCEPTANCE CRITERIA
  #
  # * Student can find a lesson
  # * Student joins the lesson
  # * Student cannot join private lessons
  let!(:lesson) { FactoryGirl.create(:lesson) }
  let(:kevin) { FactoryGirl.create(:user) }

  scenario 'Successfully find/joins lesson' do
    visit root_path
    sign_in(kevin)
    click_on "Find a Lesson!"
    click_on lesson.title
    click_on 'Enroll now!'
    expect(page).to have_content('You are enrolled!')
  end
end