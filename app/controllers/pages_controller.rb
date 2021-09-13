class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @artworks = Artwork.all
  end

  def search
    @results = PgSearch.multisearch(params[:query])
    @users = @results.select { |result| result.searchable_type == "User" }.map(&:searchable)
    @artists = @users.select(&:is_artist?)
    @owners = @users.reject(&:is_artist?)
    @venues = @results.select { |result| result.searchable_type == "Venue" }.map(&:searchable)
    @artworks = @results.select { |result| result.searchable_type == "Artwork" }.map(&:searchable)
    @collections = @results.select { |result| result.searchable_type == "Collection" }.map(&:searchable)
  end
end
