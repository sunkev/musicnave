require 'spec_helper'

describe Lesson do
  it { should belong_to :teacher }
  it { should have_many :enrollments }

  describe '#privacy_changer' do
    it 'should change the privacy of a lesson' do
      lesson = Lesson.new
      lesson.private = false
      expect(lesson.privacy_changer).to eql(true)
    end
  end
end