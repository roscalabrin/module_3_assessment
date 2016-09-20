require 'rails_helper'

RSpec.describe Api::V1::ItemsController, :type => :request do
  
  describe "GET #index" do
    it "returns all items" do
      item1 = Item.create(name: "Incredible Iron Chair")
      item2 = Item.create(name: "Rustic Marble Hat")
      
      get 'api/v1/items'
          
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)

      expect(parsed_response.first["name"]).to eq "Incredible Iron Chair"
      #  I receive a 200 JSON response containing all items 
      #  And each item has an id, name, description, and image_url but not the created_at or updated_at
    end
  end
  
  describe "GET #show" do
    it "returns all items" do
      item = Item.create(name: "Incredible Iron Chair")
      item_id = item.id
      
      get "api/v1/items/#{item_id}"
      
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      
  
    end
  end
  
  describe "DELETE #destroy" do
    xit "deletes an item" do
      item = Item.create(name: "Incredible Iron Chair")
      item_id = item.id
      
      delete "api/v1/items/#{item_id}"
      
      expect(response.status).to eq(204)
      parsed_response = JSON.parse(response.body)
      
  
    end
  end
  
  describe "POST #create" do
    it "creates an item" do
      
      post "api/v1/items", {item: {name: "Incredible Iron Chair"}}
      
      expect(response.status).to eq(201)
      parsed_response = JSON.parse(response.body)
      
    end
  end
  

end