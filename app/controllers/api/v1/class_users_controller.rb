class Api::V1::ClassUsersController < ApplicationController
  def index
    @class_user = ClassUser.show_class_user
    render json: @class_user
  end

  def search_user
    @class_room = ClassUser.searcher params[:key_word]
    render json: @class_room
  end

  def params_class_user
    params.require(:class_user).permit(:user_id, :class_room_id)
  end

  def create_class_user
    @class_user = ClassUser.new params_class_user
    if @class_user.save
      render json: @class_user
    else
      render json: {
               status: 404,
               message: "NOT FOUND",
             }
    end
  end

  def create
    check = ClassUser.check_class_user(params[:user_id], params[:class_room_id])
    if check.empty?
      create_class_user
    else
      render json: {
        status: false,
        message: "User already exists",
      }
    end
  end
end
