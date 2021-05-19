class Api::V1::ClassRoomsController < ApplicationController
  before_action :load_class_room, only: %i{show destroy update}

  def index
    @class_room = ClassRoom.all.show
    return render json: @class_room if @class_room
    render json: {
      status: "404",
      message: "Not found",
    }
  end

  def create
    @class_room = ClassRoom.new(name: params[:name], delete_class_room: false)
    if @class_room.save
      render json: {
               status: true,
               message: "Create Success",
               data: @class_room,
             }
    else
      render json: {
               status: false,
               message: "Not found",
             }
    end
  end

  def load_class_room
    @class_room = ClassRoom.show.find_by id: params[:id]
    return if @class_room
    render json: {
      status: "404",
      message: "Not found",
    }
  end

  def destroy
    @class_room.update delete_class_room: true
    if @class_room
      render json: {
               status: true,
               message: "Delete success",
             }
    else
      render json: {
               status: false,
               status: "404",
             }
    end
  end

  def update
    @class_room.update params_class_user
    if @class_room
      render json: {
               status: "Success",
               message: "Update success",
               data: @class_room,
             }
    else
      render json: {
               status: false,
               message: "Not found",
             }
    end
  end

  def show
    @list_student_of_class = ClassUser.show_list_student params[:id]
    render json: {
      class_room: @class_room,
      students: @list_student_of_class,
    }
  end
end
