class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to root_path
    else
      render :nothing => true
    end
  end
  
  private
  def user_param
      params.require(:user).permit(:username, :password)
  end
end
