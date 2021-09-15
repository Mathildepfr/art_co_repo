class ExpoCollectionsController < ApplicationController
  def new
    @expo = Expo.find(params[:expo_id])
    @expo_collection = ExpoCollection.new
  end

  def create
    @expo = Expo.find(params[:expo_id])
    @expo_collection = ExpoCollection.new(expo_collection_params)
    @expo_collection.expo = @expo
    if @expo_collection.save
      flash[:success] = "Successfully applied!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Oops, something went wrong!"
      redirect_to dashboard_path
    end
  end

  def update
    @expo_collection = ExpoCollection.find(params[:id])
    @expo_collection.update(expo_collection_params)

    redirect_to dashboard_path(section: 'expos')
  end

  def destroy
    @expo_collection = ExpoCollection.find(params[:id])
    @expo_collection.destroy

    redirect_to dashboard_path(section: 'expos')
  end

  private

  def expo_collection_params
    params.require(:expo_collection).permit(:collection_id, :status)
  end
end
