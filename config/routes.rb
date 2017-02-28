Rails.application.routes.draw do

  root 'statics#main'

  resources :answers

  resources :users, only: [:create]

  resources :events do
    resources :projects
    resources :questions
    resources :answers
  end

  post '/start_voting' => 'statics#start_voting'
  
  delete '/sign_out' => 'sessions#destroy'

  get '/admin' => 'events#index'
  get "/sign_in" => "sessions#new"
  get "/oauth_sign_in" => "sessions#create"
  get "/oauth/callback" => "sessions#create_from_oauth"

  match '*path' => redirect { |p, req| req.flash[:info] = "Please use the given passphrase to access the voting page"; '/' }, via: :get

end
