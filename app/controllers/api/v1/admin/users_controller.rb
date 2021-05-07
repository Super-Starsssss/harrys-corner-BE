class Api::V1::Admin::UsersController < ApplicationController
	def index
		render json: {message: "Hello this is user pages"}
	end
end