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
end