class UsersController < ApplicationController
  def log_in
  end

  def sign_up
    @user = User.new
  end

  def authenticate
    @user = User.find_by(email: user_params[:email])
    if @user.password == @user.salt + user_params[:password]
      # TODO
      # current_user
    else
      flash[:error] = 'Something wrong. Checkout email and password and try again'
      redirect_to users_log_in_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      UserMailer.welcome_email({
                                   email: @user.email, password: @user.password,
                                   full_name: @user.full_name, url: request.original_url
                               }).deliver_later
      redirect_to user_profile_path
    else
      render 'sign_up'
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :first_name, :last_name, :password
  end
end
