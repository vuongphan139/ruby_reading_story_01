class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update destroy)
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

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "profile_update"
      redirect_to @user
    else
      flash[:danger] = t "profile_update_fail"
      redirect_to root_url
      render :edit
    end
  end

  def show
    @btn_follow = current_user.active_relationships.build
    @btn_unfollow = current_user.active_relationships
                                .find_by followed_id: @user.id
  end

  private

  def user_params
    params.require(:user).permit User::SIGNUP_PARAMS
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user.current_user? current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_url
  end
end
