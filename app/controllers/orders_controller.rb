class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_lesson
      @order.save
      redirect_to user_path(@order.user)
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit.merge(user_id: current_user.id, lesson_id: params[:lesson_id], token: params[:token])
  end

  def set_item
    @lesson = Lesson.find(params[:lesson_id])
  end

  def pay_lesson
    @lesson = Lesson.find(params[:lesson_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @lesson.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
