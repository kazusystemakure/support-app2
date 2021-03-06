class UsersController < ApplicationController
  before_action :move_to_new_user_session
  before_action :set_item, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @lessons = @user.lessons
    @orders = @user.orders
    return redirect_to root_path if @user.publish_id == 1 && current_user.id != @user.id
  end

  def edit
    return redirect_to root_path if current_user.id != @user.id
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :namekana, :introduction, :email, :password, :password_confirmation, :postal_code, :prefecture, :city, :address, :phone_number, :skill, :birth_date, :birth_date, :publish_id, :image)
  end

  def set_item
    @user = User.find(params[:id])
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
