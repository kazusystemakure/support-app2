class UsersController < ApplicationController
  def show
    @lseeon = Lesson.find(params[:lesson_id])
    @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :namekana, :introduction, :email, :password ,:password_confirmation, :postal_code, :prefecture, :city, :address, :phone_number, :hobby, :skill, :birth_date, :birth_date, :image)
  end

end
