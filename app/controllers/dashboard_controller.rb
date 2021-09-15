class DashboardController < ApplicationController
  def dashboard
    @artworks = current_user.artworks
    @collections = current_user.collections
    @venues = current_user.venues
    @expos = current_user.expos
    @pending_expos = ExpoCollection.where(status: 'pending', expo: current_user.expos)
    @historical_expos = ExpoCollection.where(status: ['accepted', 'declined'], expo: current_user.expos)

    @applications = ExpoCollection.where(collection: @collections)
  end
end
