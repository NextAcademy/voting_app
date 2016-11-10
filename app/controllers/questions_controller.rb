class QuestionsController < ApplicationController

	def new
		@event = Event.friendly.find(params[:event_id])
		@question = @event.questions.new
	end

	def create
		@event = Event.friendly.find(params[:event_id])
		@question = @event.questions.new(question_params)

		if @question.save
			redirect_to @event
		else
			flash[:notice] = @question.errors.full_messages.join("<br/>").html_safe
			redirect_to new_question_path
		end
	end

	private

	def question_params
		params.require(:question).permit(:content)
	end

end
