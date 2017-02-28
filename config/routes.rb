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
  
  get "/auth_sign_in" => "sessions#new"
  get "oauth/callback" => "sessions#create"
  get '/admin' => 'events#index'

  match '*path' => redirect { |p, req| req.flash[:info] = "Please use the given passphrase to access the voting page"; '/' }, via: :get

end
