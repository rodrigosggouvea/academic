class Classroom < ActiveRecord::Base
  
  belongs_to :student
  belongs_to :course

  validates :entry_at,   presence: true
  validates :student_id, presence: true
  validates :course_id,  presence: true

  def self.create_by_course(params)
    params[:student_ids].each do |student_id|
      Classroom.create(course_id: params[:course_id], student_id: student_id, entry_at: Time.now)
    end
    []
  end
end
