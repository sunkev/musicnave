require 'spec_helper'

feature 'view all private messages' do

  let(:kevin) { FactoryGirl.create(:user) }
  let(:adam) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(kevin)
  end

  scenario "user sees private messages" do

    body_paragraph = 'some random text'

    click_link "Send a message"
    select adam.username, from: 'private_message_recipient_id'
    fill_in "Body", with: body_paragraph
    click_button "Send message"

    click_link 'View messages'
    expect(page).to have_content(body_paragraph)
  end
end