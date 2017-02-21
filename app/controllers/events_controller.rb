class EventsController < ApplicationController
  layout 'admin'
  before_action :ensure_signed_in, except: [:index]
  before_action :get_event_id, only: [:show, :edit, :update]

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to events_path
    else
      flash[:notice] = @event.errors.full_messages.join("<br/>").html_safe
      render 'new'
    end
  end

  def index
    redirect_to '/sign_in' unless signed_in?
    @events = Event.order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:notice] = "Updated Successfully"
      redirect_to edit_event_path(@event)
    else
      flash[:notice] = @event.errors.full_messages.join("<br/>").html_safe
      render 'edit'
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :date, :start_time, :end_time, :typeform_url, :typeform_report_url, project_attributes: [:title, :description] )
  end

  def ensure_signed_in
    unless signed_in?
      flash[:danger] = "Please log in as Admin to access the site"
      redirect_to "/"
    end
  end

  def get_event_id
    @event = Event.friendly.find(params[:id])
  end

end
