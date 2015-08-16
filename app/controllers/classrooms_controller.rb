class ClassroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses = Course.all
    # @classrooms = Classroom.where(course_id: params[:course_id]) unless params[:course_id].blank?
    @classrooms = Classroom.all
  end

  def new
    @courses = Course.all
    @students = Student.all
  end

  def create
    students = Classroom.create_by_course(params)
    if students.any?
      student_names = Student.find(students).collect(&:name).join(',')
      redirect_to new_classroom_path, notice: "Os alunos #{student_names} já haviam sido matriculados a esse curso, os outros foram matriculados com sucesso."
    else
      redirect_to classrooms_path, notice: "Alunos matriculados com sucesso."
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    respond_with(@classroom)
  end

  private
    def classroom_params
      params.permit(:course_id, :student_ids)
    end

end
