class Api::V1::AnswersController < ApplicationController
	def index
		@topic = Topic.find_by id: params[:topic_id]
		@collection = @topic.collections
		@questions = @topic.questions

	end
end