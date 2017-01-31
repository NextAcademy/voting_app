class StaticsController < ApplicationController

  def vote
    @event = Event.friendly.find(params[:passphrase])
    @question = @event.questions.find(params[:id])
    @answer = @question.answer.new
  end

  def start_voting
    @event = Event.friendly.find(params[:passphrase])

    render 'vote'
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Invalid Passphrase"
    redirect_to '/'
  end

end
