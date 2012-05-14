class SessionsController < ApplicationController

  def create
    session[:user_id] = params[:user_id]
    redirect_to current_user
  end

  def home
    if current_user
      redirect_to current_user
    else
      redirect_to get_in_path
    end
  end
end
