class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

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
    @orders = @lesson.orders
    @orders.each do |order|
      @order_user_id = order.user_id
    end
  end

  def edit
  end

  def update
    @lesson.update(lesson_params)
    if @lesson.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def lesson_params
    params.require(:lesson).permit(:image, :name, :level_id, :text, :lesson_date, :bigin_at, :closed_at, :zoom_url, :zoom_password, :price). merge(user_id: current_user.id)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end
