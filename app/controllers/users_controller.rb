class UsersController < ApplicationController
  layout 'admin'

  before_action :set_user, only: [:edit, :show, :update]

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
    @user = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @user_events = @user.events.paginate(page: params[:page], per_page: 1)
  end

  def edit
  end

  def update
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

  def set_user
    @user = User.find(params[:id])
  end
end
