class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :users_to_follow

  protected

  def configure_permitted_parameters
    added_attrs = %i[username full_name email password password_confirmation remember_me]
    update_attrs = added_attrs.dup
    update_attrs += %w[photo cover_image]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[username password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private

  def users_to_follow
    users_id = current_user.follows.pluck(:id)
    users_id << current_user.id
    @users_to_follow ||= User.where.not(id: users_id)
  end
end
