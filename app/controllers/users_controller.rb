class UsersController < ApplicationController
  def show
    @lseeon = Lesson.find(params[:lesson_id])
    @user = User.find(params[:id])
  end
end
