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

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "The user #{@user.username} has been successfully updated"
      redirect_to (events_path)
    else
      render 'edit'
    end
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
