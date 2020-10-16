class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :namekana, :sex, :hobby, :email, :encrypted_password, :postal_code, :prefecture, :city, :address, :phone_number, :birth_date, :publish_id, :skill, :introduction, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :namekana, :sex, :hobby, :email, :encrypted_password, :postal_code, :prefecture, :city, :address, :phone_number, :birth_date, :publishi_id,:skill, :introduction,:image])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む記述に変更
    end
  end
end
