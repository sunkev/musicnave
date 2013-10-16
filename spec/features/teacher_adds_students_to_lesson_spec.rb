require 'spec_helper'

feature 'teacher adds a student to the lesson at anytime' do

  let!(:kevin) { FactoryGirl.create(:user) }
  let!(:adam) { FactoryGirl.create(:user) }
  let!(:lesson) { FactoryGirl.create(:lesson) }

  before(:each) do
    sign_in( kevin )
    lesson.teacher_id = kevin.id
  end

  scenario "user sees all public lessons" do
    visit new_lesson_path(:user)
    fill_in 'Title', with: 'Flute Lessons'
    fill_in 'Description', with: 'The best lessons with KSun'
    select adam.name_and_username, from: 'lesson_student_ids'

    click_button 'Create Lesson'

    expect(page).to have_content('Lesson successfully created')
    expect(page).to have_content('Students')
    expect(page).to have_content(adam.abv_name)
  end
end