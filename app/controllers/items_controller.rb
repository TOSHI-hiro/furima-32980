class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :authenticate_user!, except: [:index,:show]  
  def index
    @items = Item.all.order("created_at DESC")
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

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      return redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
  end

  private

 
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image,:product_name,:subscription,:price,:category_id,:status_id,:prefecture_id,:shipping_id,:deadline_id,:status_id).merge(user_id: current_user.id)
  end

end

