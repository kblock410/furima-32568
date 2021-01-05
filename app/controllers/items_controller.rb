class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    if user_signed_in? && current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :days_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end
