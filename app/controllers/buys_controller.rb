class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :buy_present?, only: [:index, :create]

  def index
    @buy_shipping = BuyShipping.new
    redirect_to root_path if @item.user == current_user
  end

  def create
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping).permit(:postcode, :prefecture_id, :city, :block, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @buy_shipping.token,
      currency: 'jpy'
    )
  end

  def buy_present?
    redirect_to root_path if @item.buy.present?
  end
end
