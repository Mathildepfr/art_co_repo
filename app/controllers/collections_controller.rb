class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to collection_path(@collection)
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

    redirect_to collections_path
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :photo)
  end
end
