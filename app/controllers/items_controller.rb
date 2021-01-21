class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    @item = Item.new(pulldown_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :subscription,:price)
  end

  def pulldown_params
    params.require(:item).permit(:category_id,:status_id,:prefecture_id,:shipping_id,:deadline_id,:status_id)
  end
  
end

