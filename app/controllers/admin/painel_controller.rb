class Admin::PainelController < AdminController	
	def index
		#Crawler.get_website_fortuna
		render layout: false		
	end
end