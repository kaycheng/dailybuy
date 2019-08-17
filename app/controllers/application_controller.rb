class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, address_attributes: [:country, :state, :city, :area, :postal_code]])
  end

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path, notice: "Not allow!"
    end
  end
end
