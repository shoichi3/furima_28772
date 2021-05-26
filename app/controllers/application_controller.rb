class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?

  private

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end
end
