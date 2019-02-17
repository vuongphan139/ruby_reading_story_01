class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: %i(destroy)

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

  def index; end

  def show; end

  private

  def user_params
    params.require(:user)
          .permit User::SIGNUP_PARAMS
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user.current_user?(current_user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
