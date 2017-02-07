class StaticsController < ApplicationController

  def vote
    @event = Event.friendly.find(params[:passphrase])
    @question = @event.questions.find(params[:id])
    @answer = @question.answer.new
  end

  def start_voting
    if cookies[:vote] == params[:passphrase]
      flash[:notice] = "You can only vote once!"
      redirect_to '/'
    else
      @event = Event.friendly.find(params[:passphrase])
      cookies[:vote] = { value: params[:passphrase], expires: 1.hour.from_now }
      render 'vote'
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Invalid Passphrase!"
    redirect_to '/'
  end

end
