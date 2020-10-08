class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.includes(:user).order(id: 'DESC')
  end

  def new
    @lesson = Lesson.new
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

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    if @lesson.valid?
      redirect_to root_path
    else
      render :edit
    end
  end



  private

  def lesson_params
    params.require(:lesson).permit(:image, :name, :content, :text, :lesson_date_at, :price). merge(user_id: current_user.id)
  end

end
