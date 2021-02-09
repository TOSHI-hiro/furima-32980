class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show,:destroy]
  before_action :authenticate_user!, except: [:index,:show]  
  before_action :correct_user, only: [:edit,:update]  
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

  def destroy
    @item.destroy
    redirect_to root_path
  end 

  private

 
  def correct_user
    if current_user.id !=  @item.user_id
       redirect_to root_path
    end 
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image,:product_name,:subscription,:price,:category_id,:status_id,:prefecture_id,:shipping_id,:deadline_id,:status_id).merge(user_id: current_user.id)
  end

end

