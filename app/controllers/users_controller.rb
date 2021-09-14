class UsersController < ApplicationController
  def index
    # @users = User.all
    # @users.search_by_first_name_and_last_name(params[:query])
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @artworks = @user.artworks
    @collections = @user.collections
    @venues = @user.venues
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :is_artist, :photo)
  end
end
