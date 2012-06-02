Cribber::Application.routes.draw do

  root to: 'sessions#home'
  match '/create_session/:user_id' => 'sessions#create', as: :create_session

  match '/logout' => 'sessions#destroy',    as: :logout

  resources :users
  match '/get_in' => 'users#new',  as: :get_in

  match '/admin_credentials' => 'tweeters#admin_credentials',  as: :admin_credentials
  match '/save_admin_credentials' => 'tweeters#save_admin_credentials',  as: :save_admin_credentials
  match "/tweeters/authentication" => 'tweeters#authentication',                   as: :authentication
  match '/twitter_credentials' => 'tweeters#twitter_credentials',     as: :twitter_credentials
  match '/destroy_all_tweets' => 'tweets#destroy_all_tweets',         as: :destroy_all_tweets

  match "/tweets" => 'tweets#tweets',                                 as: :tweets
  match '/retweet_this/:id' => 'tweets#retweet',                          as: :retweet
  match '/delete_tweet/:id' => 'tweets#destroy',                           as: :delete_tweet

  match '/purge_images' => 'images#purge',                  as: :purge_images
end
