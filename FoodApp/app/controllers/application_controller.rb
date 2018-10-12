# all controllers inherit from this controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone_no home_add work_add typeofu password password_confirmation])
  end

  def after_sign_in_path_for(_resource)
    if current_user.typeofu == 'restaurant'
      restaurants_url
    else
      users_url
    end
  end

  def after_sign_up_path_for(_resource)
    if current_user.typeofu == 'restaurant'
      new_restaurant_url
    else
      users_url
    end
  end
end
