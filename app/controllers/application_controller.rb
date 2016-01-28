class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(  :email,:password, :password_confirmation, roles: []) }
  end
	protect_from_forgery with: :exception

  def layout_by_resource
    if devise_controller?
      "page"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.role == 'admin'
      admin_painel_path
    elsif current_user.role == 'empresa'
      pcompany_painel_path
    elsif current_user.role == 'cliente'
      pclient_painel_path
    end    
  end
end
