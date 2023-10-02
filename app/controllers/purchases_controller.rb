class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if current_user.nil? || (@item.user == current_user || @item.purchase.present?)
      redirect_to new_user_session_path
    else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_shipping = PurchaseShipping.new
    end
  end

  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :city_town_village, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,     # 商品の値段
      card: purchase_shipping_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

end
