class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_login
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

  def admin
    @admin ||= User.find_by_is_admin(true)
  end

  def check_admin
    redirect_to tweets_path unless current_user.is_admin?
  end

  def check_login
    redirect_to root_path unless current_user
  end

  def confirm_twitter_credentials
    unless current_user.tweeter.token?
      redirect_to twitter_credentials_path
    end
  end

end
