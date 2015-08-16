require 'rails_helper'

RSpec.describe Student, :type => :model do
  describe "Validations" do
    context "name" do
      it "should be invalid if nil, and valid otherwise" do
        student = Student.new(register_number: "Test")
        student.should_not be_valid
        student.name = "Test"
        student.should be_valid
      end
    end
    context "register_number" do
      it "should be invalid if nil, and valid otherwise" do
        student = Student.new(name: "Test")
        student.should_not be_valid
        student.register_number = "Test"
        student.should be_valid
      end
    end
  end
end
