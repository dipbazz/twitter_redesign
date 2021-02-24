class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :users_to_follow

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :full_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:username, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def users_to_follow
    @_users_to_follow ||= User.where.not(id: current_user)
  end
end
