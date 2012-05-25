Cribber::Application.routes.draw do

  root to: 'sessions#home'

  match '/logout' => 'sessions#destroy',    as: :logout

  resources :users
  match '/get_in' => 'users#new',  as: :get_in

  match '/create_session/:user_id' => 'sessions#create', as: :create_session

  match '/admin_credentials' => 'tweeters#admin_credentials',  as: :admin_credentials
  match '/save_admin_credentials' => 'tweeters#save_admin_credentials',  as: :save_admin_credentials
  match "/tweeters/authentication" => 'tweeters#authentication',                   as: :authentication
  match "/tweets" => 'tweets#tweets',                                 as: :tweets
  match '/twitter_credentials' => 'tweeters#twitter_credentials',     as: :twitter_credentials

end
