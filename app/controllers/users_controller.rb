class UsersController < ApplicationController
  def log_in
  end

  def sign_up
  end

  def create
    user.update_attributes(user_params)
    redirect_to user_profile_path
  end

  private

  helper_method :user
  def user
    @user ||= User.new(params[:user] ? user_params : {})
  end

  def user_params
    params.require(:user).permit :email, :first_name, :last_name
  end
end
