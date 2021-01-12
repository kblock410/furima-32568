class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    redirect_to root_path if @item.order.present? || current_user == @item.user
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
