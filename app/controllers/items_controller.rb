class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

def new
  @item = Item.new
end

def index
  @items = Item.includes(:user).order("created_at DESC")
end

def create
  @item = Item.new(message_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

def show
  @item = Item.find(params[:id])
end

private

def message_params
  params.require(:item).permit(:product, :product_description, :price, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
    end
  end
end
