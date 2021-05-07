class Api::V1::ClassRoomController < ApplicationController
  before_action :load_class, only: %i{ show }
  before_action :show_student_class, only: %i{ show }

  def index
    @class_room = ClassRoom.all
    return render json: @class_room if @class_room
    render json: {
             messager: "Not found!!",
           }
  end

  def show_student_class
    @student_class = StudentClass.search_id(params[:id])
    return if @student_class
    render json: {
      message: "Not found",
    }
    byebug
  end

  def load_class
    @class_room = ClassRoom.find_by id: params[:id]
    return if @class_room
    render json: {
      status: false,
      message: " not found",
    }
  end

  def show
    render json: {
      room: @class_room,
      student: @student_class,
      sl: @student_class.count,
    }
  end

  def destroy
  end
end
