class Api::V1::CollectionsController < ApplicationController
	def index
		render json: @collections = Collection.all
	end
end