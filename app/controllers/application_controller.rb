class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "Access Denied: #{exception.message}"
  end

  def after_sign_in_path_for(resource)
    if current_user.gender == "male"
      flash[:notice] = "Hi Mr #{current_user.name}"
    else
      flash[:notice] = "Hi Ms #{current_user.name}"
    end
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender,:image_data])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender,:image_data])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
end
