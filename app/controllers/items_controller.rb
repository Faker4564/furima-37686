class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  before_action :redirect_root, only: [:edit, :destroy]
  before_action :sould_out_edit, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
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
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id,
                                 :delivery_charge_id, :prefecture_id, :delivery_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def sould_out_edit
    redirect_to root_path if @item.buy.present?
  end
end
