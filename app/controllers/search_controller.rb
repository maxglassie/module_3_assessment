class SearchController < ApplicationController
  def index
    @service = BestBuyService.new(params["Search"])
    @stores_hash = @service.stores
    @stores = @stores_hash["stores"].map do |store|
        Store.new(store)
      end
      binding.pry
  end
end