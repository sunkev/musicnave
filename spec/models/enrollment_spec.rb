require 'spec_helper'

  describe Enrollment do
    it { should belong_to :lesson }
    it { should belong_to :user }
  end