class Api::V1::SessionsController < ApplicationController
	before_action :load_user, only: %i(create destroy)
	def create
		if @user&.authenticate params[:user][:password]
			render json: payload(@user)
		else
			render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
		end
	end

	def destroy
	end

	private
		def load_user
			@user = User.find_by(email: params[:user][:email])
			return @user if @user

			render json: 1, status: :not_found
		end

		def payload(user)
        return nil unless user and user.id
        {
          auth_token: JsonWebToken.encode({user_id: user.id}),
          user: {email: user.email}
        }
    end
end