class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase

    if @user&.authenticate params[:session][:password]
      log_in @user
      flash[:success] = t "login_successful"
      redirect_to root_path
    else
      flash.now[:danger] = t "invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
