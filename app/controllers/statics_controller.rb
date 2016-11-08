class StaticsController < ApplicationController

	def vote
		@event = Event.friendly.find(params[:passphrase])
		render template: 'events/show'
	end
	
	rescue_from ActiveRecord::RecordNotFound do
		flash[:notice] = "Invalid Passphrase"
	  	redirect_to '/'
	end

end
