class DashboardController < ApplicationController
  def dashboard
    @artworks = current_user.artworks
    @collections = current_user.collections
    @venues = current_user.venues
    @expos = current_user.expos
    @allexpos = Expo.all
  end
end
