class PurchasersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  def index
    @item = Item.find(params[:item_id])
    if @item.purchaser !=  nil  || @item.user_id == current_user.id
      redirect_to root_path
    end
    @purchaser_shipping = PurchaserShipping.new
  end

  def create
    @purchaser_shipping = PurchaserShipping.new(purchaser_params)
    @item = Item.find(params[:item_id])
    if  @purchaser_shipping.valid?
        pay_item
        @purchaser_shipping.save
       redirect_to root_path
    else
      render  controller: :purchasers, action: :index
    end
  end

  private

    def purchaser_params 
    params.require(:purchaser_shipping).permit(:post_numbers, :city ,:address, :building, :phone_numbers,:prefecture_id).merge(user_id:current_user.id,token: params[:token],item_id:params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price, 
        card: @purchaser_shipping.token,  
        currency:'jpy'              
      )
    end
 end
