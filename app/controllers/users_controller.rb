class UsersController < ApplicationController
  def log_in
  end

  def sign_up
  end

  def create

  end

  private

  helper_method :user
  def user
    User.find_by(id: params[:user_id]) || User.new
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
