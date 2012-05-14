class SessionsController < ApplicationController

  def create
    session[:user_id] = params[:user_id]
    redirect_to current_user
  end
end
