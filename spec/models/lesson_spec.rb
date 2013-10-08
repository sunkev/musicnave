require 'spec_helper'

describe Lesson do
  it { should belong_to :teacher }
  it { should have_many :students }
end