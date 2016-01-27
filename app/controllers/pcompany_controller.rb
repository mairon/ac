class PcompanyController < ApplicationController
	layout "pcompany"
	before_action :authenticate_user!
 	before_action :check_admin!

	private
  def check_admin!
		unless current_user.role == 'admin' or current_user.role == 'empresa'
    	redirect_to root_path, notice: 'Acesso não Autorizado!'
  	end
  end
end