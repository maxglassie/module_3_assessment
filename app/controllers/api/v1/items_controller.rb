class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all, each_serializer: ItemsSerializer
  end

  def show
    render json: Item.find(params[:id]), each_serializer: ItemSerializer
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.delete
      render :nothing => true, :status => 204, :content_type => 'text/html'
    else
      render :status => 404
    end
  end

  def create
    binding.pry
    @item = Item.new(items_params)
    if @item.save
      render json: @item, each_serializer: ItemSerializer, :status => 201
    else
      render :status => 404
    end
  end

  private

  def items_params
    params.permit(:name, :description, :image_url)
  end
end