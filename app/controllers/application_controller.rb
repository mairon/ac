class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :email
  end
	protect_from_forgery with: :exception

def layout_by_resource
    if devise_controller?
      "page"
    else
      "application"
    end
  end
end
