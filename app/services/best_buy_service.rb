class BestBuyService

  def initialize
    @conn = Faraday.new("https://api.bestbuy.com/v1") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params['apiKey'] = ENV['BEST_BUY_KEY']
    end
  end
  
  def search_by_zip_code(params)
    zip_code = params[:zip_code]
    response = @conn.get do |req|
      req.url "/v1/stores(area(#{zip_code},25))"
      req.params['format'] = "json"
      req.params['show'] = "longName,city,distance,phone,storeType"
      req.params['pageSize'] = "15"
    end
    stores = JSON.parse(response.body, symbolize_names: true)[:stores]
      stores.map do |store|
        Store.new(store)
      end
   end
end