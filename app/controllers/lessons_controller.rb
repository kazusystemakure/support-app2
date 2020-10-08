class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.includes(:user).order(id: 'DESC')
  end

  def new
    @lessom = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end


  private

  def lesson_params
    params.permit(:image, :name, :content, :text, :lesson_date_at, :price). merge(user_id: current_user.id)
  end

end
