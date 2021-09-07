class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @artworks = @user.artworks
    @collections = @user.collections
    @venues = @user.venues
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = user.find(params[:id])
  end

  def update
    @user = user.find(params[:id])
    @user.update(params[:user])
  end

  def destroy
    @user = user.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :is_artist, :photo_url, :photo)
  end
end
