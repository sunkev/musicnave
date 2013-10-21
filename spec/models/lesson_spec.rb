require 'spec_helper'

describe Lesson do
  it { should belong_to :teacher }
  it { should have_many :enrollments }
  it { should validate_presence_of :title }

  it { should allow_value(true).for(:private) }
  it { should allow_value(false).for(:private) }
  it { should_not allow_value(nil).for(:private) }

  it { should validate_presence_of :city }
  it { should validate_presence_of :state }

  describe '#privacy_changer' do
    it 'should change the privacy of a lesson' do
      lesson = Lesson.new
      lesson.private = false
      expect(lesson.privacy_changer).to eql(true)
    end
  end
end