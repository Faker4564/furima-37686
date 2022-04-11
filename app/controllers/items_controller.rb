class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save 
      redirect_to room_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, 
      :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end

end