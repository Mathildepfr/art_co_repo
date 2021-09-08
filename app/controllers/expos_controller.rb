class ExposController < ApplicationController
  def index
  end

  def show
  end

  def new
    @mediums = Expo::MEDIUM.map { |medium| [medium, medium] }
    @styles = Expo::STYLE.map { |style| [style, style] }
    @venue = Venue.find(params[:venue_id])
    @expo = Expo.new
  end

  def create
    @expo = Expo.new(expo_params)
    @venue = Venue.find(params[:venue_id])
    @expo.venue = @venue
    if @expo.save
      flash[:success] = "Successfully created expo!"
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
    params.require(:expo).permit(:start_date, :end_date, :description, :venue_id, style_list: [], medium_list: [])
  end
end
