require 'spec_helper'

describe User do

  it { should have_many :sent_messages }
  it { should have_many :received_messages }
  it { should have_many :enrollments }

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

  describe '#full_name' do
    it 'should give the full name' do
      user = User.new
      user.first_name = 'kevin'
      user.last_name = 'sun'
      expect(user.full_name).to eql('kevin sun')
    end
  end

  describe '#name_and_username' do
    it 'should give the full name and username' do
      user = User.new
      user.first_name = 'kevin'
      user.last_name = 'sun'
      user.username = 'sunkev'
      expect(user.name_and_username).to eql('kevin sun (sunkev)')
    end
  end

  describe '#abv_name' do
    it 'should give first name and abv last name' do
      user = User.new
      user.first_name = 'kevin'
      user.last_name = 'sun'
      expect(user.abv_name).to eql('kevin s.')
    end
  end
end
