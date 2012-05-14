class TweetersController < ApplicationController
  before_filter :get_client

  def admin_credentials
    @tweeter = User.first.build_tweeter
  end

  def save_admin_credentials
    tweeter = Tweeter.create! params[:tweeter]
    redirect_to tweeter.user
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
