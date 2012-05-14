class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :admin

private
  def current_user
    return nil unless session[:user_id]
    raise ActiveRecord::RecordNotFound unless User.find(session[:user_id])
    @current_user ||= User.find(session[:user_id])
  end

  def get_client
    @client ||= TwitterOAuth::Client.new(consumer_key: admin.tweeter.consumer_key, consumer_secret: admin.tweeter.consumer_secret)
  end

  def set_request_token
    @request_token = get_client.request_token(oauth_callback: authentication_url)
    session[:r_token] = @request_token
  end

  def admin
    @admin ||= User.find_by_is_admin(true)
  end

  def get_tweets
    return false unless current_user.tweeter.token?
    @tweets = TwitterOAuth::Client.new(
      :consumer_key => admin.tweeter.consumer_key,
      :consumer_secret => admin.tweeter.consumer_secret,
      :token => current_user.tweeter.token, 
      :secret => current_user.tweeter.secret
    )
  end

end
