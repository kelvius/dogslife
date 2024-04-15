# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Other methods...
  before_action :configure_permitted_parameters, if: :devise_controller?


  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
  # end

  private

  # Redirect to login page after logout
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  # devise parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[address province_id])
  end
end
