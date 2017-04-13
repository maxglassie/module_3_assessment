class SearchController < ApplicationController
  def index
    @service = BestBuyService.new(params["Search"])
    @stores = @service.stores
  end
end