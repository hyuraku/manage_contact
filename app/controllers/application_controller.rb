class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :show_404


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  protected

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action"
    redirect_to action: :index
  end

  def show_404
    render template: "errors/404", status: 404
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
