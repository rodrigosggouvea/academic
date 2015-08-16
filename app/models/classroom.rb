class Classroom < ActiveRecord::Base
  
  belongs_to :student
  belongs_to :course

  validates :entry_at,   presence: true
  validates :student_id, presence: true, uniqueness: { scope: :course_id, message: "um aluno só pode ser matriculado a um curso uma vez" }
  validates :course_id,  presence: true

  def self.create_by_course(params)
    students_already_saved = []
    params[:student_ids].each do |student_id|
      classroom = Classroom.new(course_id: params[:course_id], student_id: student_id, entry_at: Time.now)
      if classroom.valid?
        classroom.save
      else
        students_already_saved << student_id
      end
    end
    students_already_saved
  end
end
