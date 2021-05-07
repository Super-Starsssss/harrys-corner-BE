class Api::V1::Admin::DashboardsController < ApplicationController
	def index
		render json: {message: "Hello this is dashboard pages"}
	end
end