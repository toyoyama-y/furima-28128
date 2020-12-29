class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.wallet != nil
      redirect_to root_path
    end
    @buyer_form = BuyerForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new(order_params)
    if @buyer_form.valid?
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:buyer_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone).merge(user_id: current_user.id , item_id: params[:item_id])
  end


end