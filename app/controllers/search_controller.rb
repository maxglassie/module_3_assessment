class SearchController < ApplicationController
  def index
    @service = BestBuyService.new(params["Search"])
    binding.pry
    @stores = @service.stores
  end
end