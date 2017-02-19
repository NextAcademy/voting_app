class StaticsController < ApplicationController
  before_action :set_cache_buster, :check_cookies, only: [:start_voting]

  def start_voting
    @event = params[:passphrase].empty? ? nil : Event.find_by_passphrase(params[:passphrase])
    respond_to do |format|
      if @event.nil?
        format.html { redirect_to root_path, notice: 'Invalid Passphrase' }
        # format.json { render json: {erorr: "invalid passphrase" }, status: :created, location: @user }
        # format.js   { render :status => 400}
      else
        cookies[:vote] = { value: params[:passphrase], expires: 1.hour.from_now }
        format.html { render 'vote' }
        # format.json { render json: "success", status: :unprocessable_entity }
        # format.js {}
      end
    end
  end

  private

  def check_cookies
    if cookies[:vote] == params[:passphrase]
      flash[:notice] = "You can only vote once!"
      redirect_to '/'
    end
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
end
end
