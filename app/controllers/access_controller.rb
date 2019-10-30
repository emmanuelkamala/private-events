class AccessController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
     end
     
     if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)
     else
      flash.now[:notice] = "Invalid username/password combination"
      render('login')
     end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(login_path)
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(login_path)
     end
  end
end
