require 'spec_helper'

def sign_in(user)
  visit new_user_session_path
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  click_on 'Sign In'
end

def sign_out(user)
  click_on 'Sign out'
end