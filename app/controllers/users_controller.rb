class UsersController < ApplicationController
  before_action :save_login_state :only => [:new, :create]

  def new
    @user = @User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
