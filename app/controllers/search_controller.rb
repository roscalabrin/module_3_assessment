class SearchController

  def index
   conn = Faraday.new("https://api.bestbuy.com/v1") do |faraday|
     faraday.adapter  Faraday.default_adapter
     faraday.params['apiKey'] = ENV['BEST_BUY_KEY']
   end
   
   response = conn.get do |req|
     req.url '/stores(postalCode=80922)?format=json&show=storeId,storeType,name,city,region&apiKey=gpgqqrmzw86vcagmwmrn2b64'
   end
  #  https://api.bestbuy.com/v1/stores(postalCode=80922)?format=json&show=storeId,storeType,name,city,region&apiKey=gpgqqrmzw86vcagmwmrn2b64
  end
end