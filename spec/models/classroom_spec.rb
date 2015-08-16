require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  describe "Validations" do
    context "entry_at" do
      it "should be invalid if nil, and valid otherwise" do
        classroom = Classroom.new(course_id: 1, student_id: 1)
        classroom.should_not be_valid
        classroom.entry_at = Time.now
        classroom.should be_valid
      end
    end
    context "student_id" do
      it "should be invalid if nil, and valid otherwise" do
        classroom = Classroom.new(course_id: 1, entry_at: Time.now)
        classroom.should_not be_valid
        classroom.student_id = 1
        classroom.should be_valid
      end
    end
    context "course_id" do
      it "should be invalid if nil, and valid otherwise" do
        classroom = Classroom.new(student_id: 1, entry_at: Time.now)
        classroom.should_not be_valid
        classroom.course_id = 1
        classroom.should be_valid
      end
    end
    it "should not be valid if student is already saved with same course" do
      Classroom.create(student_id: 1, course_id: 1, entry_at: Time.now)
      classroom = Classroom.new(student_id: 1, course_id: 1, entry_at: Time.now)
      classroom.should_not be_valid
    end
  end
end
