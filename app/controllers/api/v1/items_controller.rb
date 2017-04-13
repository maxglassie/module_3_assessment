class Api::V1::ItemsController < ApplicationController
  def index
    binding.pry
    render json: Item.all
  end
end