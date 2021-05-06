class Api::V1::QuestionsController < ApplicationController
	before_action :load_question, only: %i(show)

	def index
		times = Question.last.id
		ids = (0..times).to_a.shuffle.take(25)
		questions = Question.where("id IN (?)", ids).includes(:answers)
		render json: questions.shuffle.take(25)
	end

	def show
		render json: @question.answers.shuffle.take(4)
	end

	private
		def load_question
			@question = Question.find_by id: params[:id]
			return if @question

			render json: {"error": "not found"}
		end
end



