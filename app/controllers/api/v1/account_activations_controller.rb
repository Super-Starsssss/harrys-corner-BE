class Api::V1::AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      render json: { message: "Activated !" }
    else
      render json: { message: "Activation fails !" }
    end
  end
end
