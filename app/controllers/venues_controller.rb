class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def map
    @venues = Venue.all

    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue }),
        image_url: helpers.asset_url('mapbox_marker2.png')
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])

    @marker = { lat: @venue.latitude,
                lng: @venue.longitude,
                info_window: render_to_string(partial: "info_window", locals: { venue: @venue }),
                image_url: helpers.asset_url('mapbox_marker2.png') }
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      flash[:success] = "Successfully created venue!"
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)

    redirect_to venue_path
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :type_of_venue, :venue_url, photos: [])
  end
end
