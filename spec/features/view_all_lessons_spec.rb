require 'spec_helper'

feature 'view all lessons' do

  scenario 'user sees lesson titles' do
    lessons = FactoryGirl.create_list(:lesson, 3)

    visit lessons_path

    lessons.each do |lesson|
      expect(page).to have_content(lesson.title)
    end
  end

end