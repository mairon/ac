class AdminController < ApplicationController
	layout "admin"
	before_action :authenticate_user!
 	before_action :check_admin!
	private
  def check_admin!
		unless current_user.role == 'admin'
    	redirect_to root_path, notice: 'Acesso não Autorizado!'
  	end
  end  
end