class SessionsController < ApplicationController
  skip_before_filter :check_login, only: [:create, :home]

  def create
    session[:user_id] = params[:user_id]
    if current_user.is_admin?
      redirect_to admin_credentials_path
    else
      redirect_to current_user
    end
  end

  def home
    if current_user.try(:is_admin?)
      redirect_to admin_credentials_path
    elsif current_user
      redirect_to current_user
    else
      redirect_to get_in_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
