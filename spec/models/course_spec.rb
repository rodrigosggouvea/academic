require 'rails_helper'

RSpec.describe Course, :type => :model do
  describe "Validations" do
    context "name" do
      it "should be invalid if nil, and valid otherwise" do
        course = Course.new(description: "Test")
        course.should_not be_valid
        course.name = "Test"
        course.should be_valid
      end
    end
    context "description" do
      it "should be invalid if nil, and valid otherwise" do
        course = Course.new(name: "Test")
        course.should_not be_valid
        course.description = "Test"
        course.should be_valid
      end
    end
  end
end
