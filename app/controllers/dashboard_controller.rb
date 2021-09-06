class DashboardController < ApplicationController
  def dashboard
    @sent_expos = current_user.expos
    @collections = current_user.collections
    @pending_expos = Expo.where(status: 'pending', collection: current_user.collections)
    @historical_expos = Expo.where(status: ['accepted', 'declined'], collection: current_user.collections)
  end
end
