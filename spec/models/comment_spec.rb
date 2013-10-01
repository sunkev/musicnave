require 'spec_helper'

describe Comment do

  it { should have_valid(:body).when('byebye', 'hihi') }
  it { should_not have_valid(:body).when(nil, '') }

end
