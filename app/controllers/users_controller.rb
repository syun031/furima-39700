class UsersController < ApplicationController

  def edit
  end

  def new
    @user = User.new
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save

    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date).merge(user_id: current_user.id)

  end
end
