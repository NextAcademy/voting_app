class StaticsController < ApplicationController

  def vote
    @event = Event.friendly.find(params[:passphrase])
    render 'vote'
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = "Invalid Passphrase"
    redirect_to '/'
  end

end
