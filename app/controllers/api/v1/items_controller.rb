class Api::V1::ItemsController < ApplicationController
  def index
    @item = Item.all
  end
  
  def show
  end
  
  def create
  end
  
  def destroy
  end
end