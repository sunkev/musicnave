require 'spec_helper'

feature 'view all lessons' do

  let(:kevin) { FactoryGirl.create(:user) }

  scenario "user sees all public lessons" do

    lessons = FactoryGirl.create_list(:lesson, 3)

    sign_in( kevin )
    lessons.each do |lesson|
      expect(page).to have_content(lesson.title)
    end
  end

  scenario "user sees personal lessons" do
    title = 'Flute Lessons'
    lessons = FactoryGirl.create_list(:lesson, 3)

    sign_in( kevin )
    click_on 'My Lessons'

    lessons.each do |lesson|
      expect(page).to_not have_content(lesson.title)
    end

    click_on 'Make a lesson'
    fill_in 'Title', with: title
    fill_in 'Description', with: 'The best lessons with KSun'
    click_button 'Create Lesson'

    click_on 'My Lessons'
    expect(page).to have_content(title)
  end


end