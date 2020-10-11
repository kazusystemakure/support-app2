class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lessons = @user.lessons
    @orders = @user.orders
  end

  def edit
    @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :namekana, :introduction, :email, :password ,:password_confirmation, :postal_code, :prefecture, :city, :address, :phone_number, :skill, :birth_date, :birth_date, :image)
  end

end
