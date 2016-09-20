require 'rails_helper'

RSpec.describe Api::V1::ItemsController, :type => :request do
  
  describe "GET #index" do
    it "returns all items" do
      item1 = Item.create(name: "Incredible Iron Chair", description: "item details")
      item2 = Item.create(name: "Rustic Marble Hat", description: "hat details")
      
      get 'api/v1/items'
          
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)

      expect(parsed_response.length).to eq(2)
      expect(parsed_response.first["name"]).to eq "Incredible Iron Chair"
      expect(parsed_response.first["description"]).to eq "item details"
      expect(parsed_response.second["name"]).to eq "Rustic Marble Hat"
      expect(parsed_response.second["description"]).to eq "hat details"
    end
  end
  
  describe "GET #show" do
    it "returns all items" do
      item = Item.create(name: "Created Item")
      item_id = item.id
      
      get "api/v1/items/#{item_id}"
      
      expect(response.status).to eq(200)
  
      parsed_response = JSON.parse(response.body)    
      expect(parsed_response["name"]).to eq("Created Item")
    end
  end
  
  describe "DELETE #destroy" do
    it "deletes an item" do
      item = Item.create(name: "Incredible Iron Chair")
      item_id = item.id
      
      delete "api/v1/items/#{item_id}"
      
      expect(response.status).to eq(204)
      expect(response.body).to eq("")
  
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