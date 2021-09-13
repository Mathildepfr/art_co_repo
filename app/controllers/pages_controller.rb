class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @artworks = Artwork.all
  end

  def search
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
  end

end
