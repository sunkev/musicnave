require 'spec_helper'

def sign_in(user)
  visit new_user_session_path
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  click_on 'Sign in'
end

def sign_out(user)
  click_on 'Logout'
end