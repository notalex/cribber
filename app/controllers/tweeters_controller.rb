class TweetersController < ApplicationController
  before_filter :get_client

  def admin_credentials
    @tweeter = User.first.build_tweeter
  end

  def save_admin_credentials
    tweeter = Tweeter.create! params[:tweeter]
    redirect_to tweeter.user
  end

  def authenticate
    @request_token = @client.request_token(oauth_callback: authentication_url)
    session[:r_token] = @request_token
  end

  def authentication
    access_token = @client.authorize(
      session[:r_token].token,
      session[:r_token].secret,
      :oauth_verifier => params[:oauth_verifier]
    )
    User.last.create_tweeter! token: access_token.token, secret: access_token.secret
    redirect_to tweets_path
  end

  def tweets
    @user = TwitterOAuth::Client.new(
      :consumer_key => Tweeter.first.consumer_key,
      :consumer_secret => Tweeter.first.consumer_secret,
      :token => Tweeter.last.token, 
      :secret => Tweeter.last.secret
    )
  end

private
  def get_client
    @client ||= TwitterOAuth::Client.new(consumer_key: Tweeter.first.consumer_key, consumer_secret: Tweeter.first.consumer_secret)
  end
end
