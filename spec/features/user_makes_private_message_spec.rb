require 'spec_helper'

feature 'user gives another user a private message', %Q{
  As a secretive user
  I want to send private messages
  So that I can tell who I want sensitive information
} do

  # Acceptance Criteria
  # * Cannot give self a private message
  # * Both users see the message
  # * The recipent can replay with another private message
  # * Has a title
  # * Has a message body
  # * Has the date for each pm
  # * Has a profile picture of both users

  let(:kevin) { FactoryGirl.create(:user) }
  let(:adam) { FactoryGirl.create(:user) }

  scenario 'kevin sends a message to adam' do

    expect(kevin.sent_messages.count).to eql(0)
    expect(adam.received_messages.count).to eql(0)

    body_paragraph = 'some random text'

    visit new_user_session_path
    fill_in 'Username', with: kevin.username
    fill_in 'Password', with: kevin.password

    click_button 'Sign in'

    visit root_path

    click_link "Private messages"
    click_link "New message"
    select adam.username, from: 'Recipient'
    fill_in "Body", with: body_paragraph
    click_button "Send message"

    expect(kevin.sent_messages.count).to eql(1)
    expect(adam.received_messages.count).to eql(1)

    expect(page).to have_content(body_paragraph)
    expect(page).to have_content("Message sent")

    click_button 'Sign out'
    visit new_user_session_path
    fill_in 'Username', with: kevin.username
    fill_in 'Password', with: kevin.password

    click_button 'Sign in'


  end



  scenario 'can see the date created'
end
