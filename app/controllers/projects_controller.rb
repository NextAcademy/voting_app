class ProjectsController < ApplicationController
	def new
		@event = Event.friendly.find(params[:event_id])
		@project = @event.projects.new
	end

	def create
		@event = Event.friendly.find(params[:event_id])
		@project = @event.projects.new(project_params)

		if @project.save
			redirect_to @event
		else
			flash[:notice] = @project.errors.full_messages.join("<br/>").html_safe
			redirect_to new_project_path
		end
	end

	private

	def project_params
		params.require(:project).permit(:title, :description)
	end

end
