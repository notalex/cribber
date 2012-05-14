Cribber::Application.routes.draw do


  resources :users

  match '/admin_credentials' => 'tweeters#admin_credentials',  as: :admin_credentials
  match '/save_admin_credentials' => 'tweeters#save_admin_credentials',  as: :save_admin_credentials
  match "/authenticate" => 'tweeters#authenticate',       as: :authenticate
  match "/tweeters/tweets" => 'tweeters#tweets',                   as: :tweets
  match "/tweeters/authentication" => 'tweeters#authentication',                   as: :authentication

end
