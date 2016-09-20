require 'rails_helper'

RSpec.describe Api::V1::ItemsController, :type => :request do
  
  describe "GET #index" do
    it "returns all items" do
      item1 = Item.create(name: "Incredible Iron Chair")
      item2 = Item.create(name: "Rustic Marble Hat")
      
      get 'api/v1/items'
      
      expect(response).to be_sucess
      
      #  I receive a 200 JSON response containing all items 
      #  And each item has an id, name, description, and image_url but not the created_at or updated_at
    end
  end
  
  describe "GET #show" do
    it "returns all items" do
      item = Item.create(name: "Incredible Iron Chair")
      item_id = item.id
      
      get "api/v1/items/#{item_id}"
      
      expect(response).to be_sucess
      
      #  I receive a 200 JSON response containing all items 
      #  And each item has an id, name, description, and image_url but not the created_at or updated_at
    end
  end

end