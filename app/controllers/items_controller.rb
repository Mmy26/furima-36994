class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :fee_id, :region_id, :shipped_day_id, :price)
  end
end
