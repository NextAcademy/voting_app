class EventsController < ApplicationController

	before_action :ensure_signed_in, only: [:new, :index]

	def new
		@event = current_user.events.new
	end

	def create

		if params[:event][:date].nil?
			params[:event][:date] = Date.parse(params[:event][:date])
		end

		params[:event][:start_time] = Time.parse(params[:start_time][:hour] << ":" << params[:start_time][:minute])
		params[:event][:end_time] = Time.parse(params[:end_time][:hour] << ":" << params[:end_time][:minute])

		@event = current_user.events.new(event_params)
		if @event.save
			redirect_to events_path
		else
			flash[:notice] = @event.errors.full_messages.join("<br/>").html_safe
			render 'new'
		end
	end

	def index
		@events = current_user.events.all
	end

	def show
		@event = Event.friendly.find(params[:id])
	end


	private
	def event_params
		params.require(:event).permit(:name, :description, :date, :start_time, :end_time, project_attributes: [:title, :description] )
	end

	def ensure_signed_in
		unless signed_in?
			flash[:danger] = "Please log in as Admin to access the site"
			redirect_to "/"
		end
	end

end
