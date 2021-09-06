class ExposController < ApplicationController
  def index
  end

  def show
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @expo = Expo.new
  end

  def create
    @expo = Expo.new(expo_params)
    @venue = Venue.find(params[:venue_id])
    @expo.venue = @venue
    @expo.rat = current_rat
    if @expo.save
      flash[:success] = "Successfully created expo!"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @expo = Expo.find(params[:id])
  end

  def update
    @expo = Expo.find(params[:id])
    @expo.update(expo_params)

    redirect_to dashboard_path
  end

  def destroy
    @expo = Expo.find(params[:id])
    @expo.destroy

    redirect_to dashboard_path
  end

  private

  def expo_params
    params.require(:expo).permit(:start_date, :end_date, :description, :venue_id)
  end
end
