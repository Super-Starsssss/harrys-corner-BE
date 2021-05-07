class Api::V1::UsersController < ApplicationController
	before_action :authenticate_request!, only: %i(show)
	def show
		@users = User.all
		render json: @users
	end

	def create
		user = User.new(user_params)
 		if user.save!
			user.send_activation_mail
			render json: {message: "Please checking your email and active your account confirm !"}, status: 200
		end
	rescue StandardError => e
		render json: {message: e.message}, status: 201
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end