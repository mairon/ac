class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
	layout :layout_by_resource

  after_filter :store_location

  def set_locale
    I18n.locale = if params[:locale].present?
                    params[:locale] # Here you might want to do some checking to allow only your desired locales
                  else
                    extract_locale_from_accept_language_header
                  end
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  protected

  def extract_locale_from_accept_language_header
    preferred_language = request.env['HTTP_ACCEPT_LANGUAGE'] || ''
    preferred_language = preferred_language.scan(/^[a-z]{2}/).first
    available_locales= ("en" "es" "pt")
    if available_locales.include?(preferred_language)
      preferred_language
    else
      "en"
    end
  end

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

  def store_location
    if (!request.fullpath.match("/users") &&
      !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url]

  #   if current_user.role == 'admin'
  #     admin_painel_path
  #   elsif current_user.role == 'empresa'
  #     pcompany_painel_path
  #   elsif current_user.role == 'cliente'
  #     pclient_painel_path
  #   end
  end
end
