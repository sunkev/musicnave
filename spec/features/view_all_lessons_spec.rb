require 'spec_helper'

feature 'view all lessons' do

  let(:kevin) { FactoryGirl.create(:user) }
  let!(:lessons) { FactoryGirl.create_list(:lesson, 3) }

  before(:each) do
    sign_in(kevin)
  end

  scenario "user sees all public lessons" do
    lessons.each do |lesson|
      expect(page).to have_content(lesson.title)
      expect(page).to have_content(lesson.description)
    end
  end


  scenario "user sees all public lessons from anywhere" do
    click_on "Find a Lesson!"
    lessons.each do |lesson|
      expect(page).to have_content(lesson.title)
      expect(page).to have_content(lesson.description)
    end
  end

  scenario "user sees personal lessons" do
    title = 'Flute Lessons'
    click_on 'My Lessons'

    lessons.each do |lesson|
      expect(page).to_not have_content(lesson.title)
      expect(page).to_not have_content(lesson.description)
    end

    click_on 'Make a lesson'
    fill_in 'Title', with: title
    fill_in 'Description', with: 'The best lessons with KSun'
    click_button 'Create Lesson'

    click_on 'My Lessons'
    expect(page).to have_content(title)
  end
end