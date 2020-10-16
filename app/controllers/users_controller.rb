class UsersController < ApplicationController
  before_action :move_to_new_user_session

  def show
    @user = User.find(params[:id])
    @lessons = @user.lessons
    @orders = @user.orders
    return redirect_to root_path if @user.publish_id==1 && current_user.id != @user.id
  end

  def edit
    @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :namekana, :sex, :hobby, :email, :password ,:password_confirmation, :postal_code, :prefecture, :city, :address, :phone_number, :birth_date, :publish_id, :skill, :introduction, :image)
  end
  
  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
    
end
