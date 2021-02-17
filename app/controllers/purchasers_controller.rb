class PurchasersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  def index
    @purchaser_shipping = PurchaserShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchaser_shipping = PurchaserShipping.new(purchaser_params)
    @item = Item.find(params[:item_id])
    if  @purchaser_shipping.valid?
        pay_item
        @purchaser_shipping.save
       redirect_to action: :index
    else
      render  controller: :purchasers, action: :index
    end
  end

  private

    def purchaser_params 
    params.require(:purchaser_shipping).permit(:post_numbers, :city ,:address, :building, :phone_numbers,:prefecture_id).merge(user_id:current_user.id,token: params[:token],item_id:params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: @purchaser_shipping.token,    # カードトークン
        currency:'jpy'                 # 通貨の種類(日本円)
      )
    end
  end
