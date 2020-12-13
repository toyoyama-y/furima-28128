class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :seller, only: [:edit, :update]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def seller
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

end
