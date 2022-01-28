class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] || root_path
    else
      flash.now[:alert] = 'Are you Guru? Verify your email and password please'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end
end