class CollectionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update(params[:collection])
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    redirect_to dashboard_path
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :photo)
  end
end
