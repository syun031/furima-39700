class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]

def new
  @item = Item.new
end

def index
end

private

def message_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
    end
  end
end
