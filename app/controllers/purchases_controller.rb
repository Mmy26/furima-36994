class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:zip_code, :region_id, :city, :street, :building,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

 
end
