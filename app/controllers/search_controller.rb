class SearchController < ApplicationController

  def index
    @results = BestBuyService.new.search_by_zip_code(params)
  end
end