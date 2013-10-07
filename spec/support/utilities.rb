require 'spec_helper'

def sign_in( user )

  visit new_user_session_path
  fill_in 'user_username', with: user.username
  fill_in 'user_password', with: user.password
  click_on 'Sign in'

end
