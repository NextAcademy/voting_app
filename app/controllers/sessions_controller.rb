class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to "http://localhost:3000/oauth/authorize?response_type=code&client_id=#{ENV["CLIENT_ID"]}&redirect_uri=#{ENV["CALLBACK_URL"]}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're now logged out"
  end

  def create_from_oauth
    # FUCK UNIREST. FUCKING USELESS PIECE OF SHIT.
    # FUCK YOU UNIREST, FUCK YOU.
    response = RestClient.post("http://localhost:3000/oauth/token",
                               {
                                 "client_id": ENV['CLIENT_ID'],
                                 "client_secret": ENV['CLIENT_SECRET'],
                                 "grant_type": "authorization_code" ,
                                 "code": params[:code],
                                 "redirect_uri": "http://localhost:3001/oauth/callback"
    })
    auth_hash = JSON.parse(response.body)

    user = User.find_by_email_and_user_uuid(auth_hash["email"], auth_hash["user_uuid"]) || User.create(name: auth_hash["name"], email: auth_hash["email"], user_uuid: auth_hash["user_uuid"])

    if user.id
      session[:user_id] = user.id
      redirect_to '/admin'
    else
      redirect_to '/sign_in', notice: "Something went wrong, please contact the admin."
    end
  end
end
