class BuysController < ApplicationController
  before_action :find_item, only: [:index, :create]

  def index
    @buy_shipping = BuyShipping.new
  end

  def create
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
       @buy_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def buy_params
    params.require(:buy_shipping).permit(:postcode, :prefecture_id, :city, :block, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
  
end
