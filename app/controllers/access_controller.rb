class AccessController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
  end

  def login
  end

  def attempt_login
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid email/password"
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to(root_path)
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(login_path)
     end
  end
end
