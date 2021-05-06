class Api::V1::UsersController < ApplicationController
	before_action :authenticate_request!, only: %i(show)
	def show
		@users = User.all
		render json: @users
	end

	def create
		user = User.new(user_params)
<<<<<<< HEAD
		user.save!
		render json: {message: "Success !"}
	rescue StandardError => e
		render json: e, status: 404
=======
 		if user.save!
			user.send_activation_mail
		end
		render json: {message: "Please checking your email and active your account confirm !", status: 200}
	rescue StandardError => e
		render json: {message: e.message, status: 400}
>>>>>>> 5a8fbcfdae558364cfa89d2718d08fb0d031a91f
	end

	private

		def user_params
<<<<<<< HEAD
			params.require(:user).permit :name, :email, :password, :password_confirmation
=======
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
>>>>>>> 5a8fbcfdae558364cfa89d2718d08fb0d031a91f
		end
end