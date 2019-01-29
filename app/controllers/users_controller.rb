class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_activation_email
      flash[:info] = t "notice"
      redirect_to root_url
    else
      flash.now[:danger] = t "sign_up_fail"
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
          .permit User::SIGNUP_PARAMS
  end
end
