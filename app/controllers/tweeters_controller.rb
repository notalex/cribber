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
    @request_token = @client.request_token(oauth_callback: tweets_url)
  end

  def tweets
    access_token = @client.authorize(
    params[:oauth_token],
    @client.request_token,
    :oauth_verifier => params[:oauth_verifier]
    )
  end

private
  def get_client
    @client ||= TwitterOAuth::Client.new(consumer_key: Tweeter.first.consumer_key, consumer_secret: Tweeter.first.consumer_secret)
  end
end
