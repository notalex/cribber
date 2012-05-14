class TweetersController < ApplicationController
  before_filter :get_client, only: :authentication

  def admin_credentials
    @tweeter = current_user.tweeter
  end

  def save_admin_credentials
    current_user.tweeter.update_attributes! params[:tweeter]
    redirect_to logout_path
  end

  def authentication
    access_token = @client.authorize(
      session[:r_token].token,
      session[:r_token].secret,
      :oauth_verifier => params[:oauth_verifier]
    )
    current_user.tweeter.update_attributes! token: access_token.token, secret: access_token.secret
    redirect_to current_user
  end

end
