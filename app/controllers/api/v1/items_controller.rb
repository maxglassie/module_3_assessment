class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all, each_serializer: ItemsSerializer
  end

  def show
    render json: Item.find(params[:id]), each_serializer: ItemSerializer
  end
end