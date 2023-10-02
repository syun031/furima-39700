class ShippingsController < ApplicationController

  def index
    @shipping = Shipping.all
  end

  def create
    @shipping = Shipping.new(message_params)
    if @shipping.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:purchase).permit(:product, :product_description, :price, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end
end
