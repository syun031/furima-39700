class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]

def new
  @item = Item.new
end

def index
  @item = Item.new
end

def create
  Item.create(message_params)
  redirect_to '/'
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
