require 'spec_helper'

describe User do

  it { should have_many :sent_messages }
  it { should have_many :received_messages }

  it { should have_valid(:first_name).when('Kevin', 'John') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Swanson') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:username).when('bunny', 'winningguy23') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:email).when('email@email.com', 'secondemail@email.com') }
  it { should_not have_valid(:email).when('nil', '', 'wefipom2', 'ewimfk@coms') }

  it 'has a password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
