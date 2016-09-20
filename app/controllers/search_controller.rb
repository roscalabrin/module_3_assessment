class SearchController < ApplicationController

  def index
   conn = Faraday.new("https://api.bestbuy.com/v1") do |faraday|
     faraday.adapter  Faraday.default_adapter
     faraday.params['apiKey'] = ENV['BEST_BUY_KEY']
   end
   
   zip_code = params[:zip_code]
   response = conn.get do |req|
     req.url "/v1/stores(area(#{zip_code},25))"
     req.params['format'] = "json"
     req.params['show'] = "longName,city,distance,phone,storeType"
     req.params['pageSize'] = "15"
    #  req.params['apiKey'] = ENV['BEST_BUY_KEY']
   end
   JSON.parse(response.body)
  end
end