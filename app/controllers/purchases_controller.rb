class PurchasesController < ApplicationController
  before_action :authenticate_user!,       only: :index
  before_action :contributor_confirmation, only: :index
  
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:zip_code, :region_id, :city, :street, :building,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end 
  end
end
