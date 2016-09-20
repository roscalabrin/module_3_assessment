class Api::V1::ItemsController < ApplicationController
  respond_to :json
  
  def index
    items = Item.all
    respond_with items
  end
  
  def show
    item = Item.find(params[:id])
    respond_with item
  end
  
  def create
    item = Item.new(item_params)
    if item.save
      respond_with item, status: :created
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      item = {}
      respond_with item, status: :no_content
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end