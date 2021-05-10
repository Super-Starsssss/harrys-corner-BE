class Api::V1::StudentClassesController < ApplicationController
  before_action :load_student_class, only: %i{update , delete_student , add_user}
  #   before_action :add_user

  def index
    @student_class = StudentClass.show_student
    if @student_class.empty?
      render json: {
               status: false,
               message: "Null",
             }
    else
      render json: @student_class
    end
  end

  def add_user
    @user = User.find_by id: @student_class.Student.user_id
  end

  def load_student_class
    @student_class = StudentClass.show_student.find_by id: params[:id]
    return if @student_class
    render json: {
      status: false,
      message: "Not found student_class !",
    }
  end

  def params_student_class
    params.require(:student_class).permit(:student_id, :class_room_id)
  end

  def create
    byebug
    @student_class = StudentClass.new params_student_class
    byebug
    if @student_class.save
      render json: {
               status: true,
               message: "Create success !!",
               data: @student_class,

             }
    else
      render json: {
               status: false,
               message: @student_class.errors,
             }
    end
  end

  def update
    if @student_class.nil?
      render json: {
               status: true,
               message: "404",
             }
    else
      @student_class.update params_student_class
      render json: {
               status: true,
               data: @student_class,
             }
    end
  end

  def delete_student
    if @student_class.nil?
      render json: {
               status: true,
               message: "404",
             }
    else
      @student_class.update delete_student: true
      render json: {
               status: true,
               message: "Delete success",
             }
    end
  end
end
