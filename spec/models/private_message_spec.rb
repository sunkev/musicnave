require 'spec_helper'

describe PrivateMessage do
  it { should belong_to :recipient }
  it { should belong_to :sender }

  it { should have_valid(:body).when('Body text', 'Super random 23123') }
  it { should_not have_valid(:body).when(nil, '') }
end