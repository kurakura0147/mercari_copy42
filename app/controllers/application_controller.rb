class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, address_attributes: [:postal_code, :prefecture, :city, :house_number, :building_name, :user_id]])

    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, address_attributes: [:postal_code, :prefecture, :city, :house_number, :building_name]])
  end


end
