class ItemsController < ApplicationController
  before_action :set_item,
                only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation,  only: [:edit, :update, :destroy]
  before_action :stock_confirmation,        only: :edit

  def index
    @item = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :fee_id, :region_id, :shipped_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def stock_confirmation
    redirect_to root_path if @item.purchase.present?
  end
end
