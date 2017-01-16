class SessionsController < ApplicationController
  skip_before_action  :logged_in_user, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by_name  params[:session][:name]
    if user && user.authenticate(params[:session][:password])
      log_in  user
      redirect_to dashboard_url
    else
      flash.now[:danger] = 'Invalid email/password combination' # 不完全正确
      render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end
end
