class UsersController < ApplicationController
  layout 'admin'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Private Events #{@user.username}"
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
