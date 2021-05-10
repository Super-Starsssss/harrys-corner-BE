class Api::V1::ClassRoomsController < ApplicationController
  before_action :load_class_room, only: %i{show update delete_class}

  def index
    @class_room = ClassRoom.show_index

    if @class_room.empty?
      render json: {
               status: false,
               message: "class_room empty",
             }
    else
      render json: {
               classes: @class_room,
             }
    end
  end

  def load_class_room
    @class_room = ClassRoom.show_class.find_by id: params[:id]
    return if @class_room
    render json: {
      status: false,
      message: "Not Found!!",
    }
  end

  def show
    render json: @class_room
  end

  def delete_class
    if @class_room.nil?
      render json: {
               status: false,
               message: "404",
             }
    else
      @class_room.update delete_class: true
      render json: {
               status: true,
               message: "Delete success",
             }
    end
  end

  def def(update)
    if @class_room.nil?
      render json: {
               status: false,
               error: @class_room.errors,
             }
    else
      @class_room.update class_room_params
      render json: {
               status: true,
               message: "update success",
               data: @class_room,
             }
    end
  end

  def class_room_params
    return params.require(:class_room).permit(:name, :teacher_id)
  end

  def create
    @class_room = ClassRoom.new class_room_params
    if @class_room.save
      render json: {
               status: true,
               data: @class_room,
             }
    else
      render json: {
               status: false,
               message: @class_room.errors,
             }
    end
  end
end
