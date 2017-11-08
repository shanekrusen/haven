class UsersController < ApplicationController
  before_action :save_login_state, only: [:new, :create]
  before_action :authenticate_user, only: [:services, :update_services]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      flash[:notice] = "You signed up succesfully"
      flash[:color] = "valid"
      redirect_to root_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
      redirect_to new_user_path
    end
  end

  def destroy

  end

  def services

  end

  def update_services
    @services = []

    params.each do |name, value|
      if value == "1"
        @services << name
      end
    end

    @current_user.update_attribute(:services, @services)

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :zip_code, :volunteer)
  end

end
