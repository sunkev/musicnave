require 'spec_helper'

feature 'user can see edited profile photo',%Q{
  As an authenticated user
  I want to see my profile page
  So that I know what I look like
}do

# ACCEPTANCE CRITERIA
#
# If I hit my profile, i see my profile
# I see addition information if I added it
# If it is not added, I can hit the edit page

  describe 'a signed in user' do

    let(:kevin) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in( kevin )
    end

    scenario 'sees profile information' do
      click_on 'My Profile'
      page.should have_content(kevin.first_name)
      page.should have_content(kevin.last_name)
      page.should have_content(kevin.email)
    end

    scenario 'profile page links to edit profile' do
      click_on 'My Profile'
      expect(page).to have_selector('a', text: 'Edit Profile', count: 2)
    end
  end
end
