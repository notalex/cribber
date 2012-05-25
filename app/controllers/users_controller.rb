class UsersController < ApplicationController

  skip_before_filter :check_login, only: [:new, :create]
  before_filter :confirm_twitter_credentials, only: [:edit]

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    registered_user = User.find(:first, conditions: ["lower(name) = ?", params[:user][:name].downcase])
    if registered_user.nil? and (@user = User.create(params[:user]))
      redirect_to create_session_path(@user.id)
    elsif registered_user.confirm_password?(params[:user][:password])
      redirect_to create_session_path(registered_user.id)
    else
      flash[:name_error] = "Registered Username" if registered_user
      redirect_to get_in_path, notice: 'Incorrect Password'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes! params[:user]
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to logout_path
  end
end
