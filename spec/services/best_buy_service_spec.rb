require 'rails_helper'

describe BestBuyService do
  context "#search_by_zip_code" do
    xit "finds stores by zip code" do
      VCR.use_cassette("best_by_search_by_zipcode") do
        search_result = BestBuyService.new.search_by_zip_code(zip: "80202")
        store =search_result.first

        # expect(stores.count).to eq(15)
        expect(store["longName"]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      end
    end
  end
end