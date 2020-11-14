class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def create
    Item.create(item_params)
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_id, :area_id, :days_id, :price)
  end

end
