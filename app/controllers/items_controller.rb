class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destory, :edit, :update]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :already_sold, only: [:edit, :update, :destory]

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
  end

  def destroy
    @item.destroy if current_user == @item.user
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :days_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def already_sold
    redirect_to root_path if @item.order.present?
  end

end
