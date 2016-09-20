class Store
  attr_reader :name, :city, :distance, :phone, :type
  
  def initialize(raw_data)
    @name = raw_data[:longName]
    @city      = raw_data[:city]
    @distance  = raw_data[:distance]
    @phone     = raw_data[:phone]
    @type      = raw_data[:storeType]
  end
end