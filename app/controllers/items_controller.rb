class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
    # @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

end
