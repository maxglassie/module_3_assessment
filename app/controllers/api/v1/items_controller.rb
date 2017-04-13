class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all, each_serializer: ItemsSerializer
  end
end