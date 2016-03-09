class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the FBB App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile is updated!"
      redirect_to @user
    else
      render "edit"
    end
  end
  
  def followings
    @user = User.find(params[:user_id])
    @followings = @user.following_users
  end
  
  def followers
    @user = User.find(params[:user_id])
    @followers = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
 
end