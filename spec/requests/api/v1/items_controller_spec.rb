require 'rails_helper'

Rspec.describe Api::V1::ItemsController, :type => :request do
  describe "GET #index" do
    
    get 'api/vi/items'
    expect(response).to be_sucess
    
  end
end