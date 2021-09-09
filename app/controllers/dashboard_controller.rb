class DashboardController < ApplicationController
  def dashboard
    @artworks = current_user.artworks
    @collections = current_user.collections
    @venues = current_user.venues
  end
end
