require 'spec_helper'

feature 'authenicated user adds a photo to a lesson',%Q{
  As an authenticated user
  I want to upload a photo to the lesson
  So that people are attracted to the lesson
}do

# ACCEPTANCE CRITERIA
#
# The image must be in a valid format( jpeg, png, ... )
# The image must within width/height and file size restrictions
# If I do not upload this type of photo, I get an error message
# If I am successful, I can see my image

  describe 'a signed in user' do

    scenario 'with an image selected' do
      teacher = FactoryGirl.create(:user)
      sign_in(teacher)
      lesson = FactoryGirl.create(:lesson)
      lesson.update(teacher_id: teacher.id)

      click_on "My Lessons"
      click_on 'Edit lesson'

      page.should have_content('Upload a Photo')
      page.attach_file('lesson_lesson_photo', Rails.root + 'spec/support/images/image.jpg')
      click_on 'Confirm edit'

      page.should have_content('Lesson was successfully updated.')
    end
  end
end
