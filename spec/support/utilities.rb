require 'spec_helper'

def sign_in( user )

  visit new_user_session_path
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  click_on 'Sign in'

end

# <h1><a href="http://localhost:3000/home/index"><%= image_tag "ugly_logo.png", :class => "logo"  %></h1>