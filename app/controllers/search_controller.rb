class SearchController < ApplicationController

  def index
   conn = Faraday.new("https://api.bestbuy.com/v1") do |faraday|
     faraday.adapter  Faraday.default_adapter
     faraday.params['apiKey'] = ENV['BEST_BUY_KEY']
   end
   
   response = conn.get do |req|
     req.url "/stores(area#{params[:zip_code]},25)"
     req.params['format'] = "json"
     req.params['show'] = "longName,city,distance,phone,storeType"
     req.params['pageSize'] = "15"
   end
   JSON.parse(response.body)
      # https://api.bestbuy.com/v1/stores(area(80202, 25))?format=json&show=longName,city,distance,phone,storeType&apiKey=gpgqqrmzw86vcagmwmrn2b64&pageSize=15
  end
end