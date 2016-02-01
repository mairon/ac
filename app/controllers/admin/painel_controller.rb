class Admin::PainelController < AdminController	
	def index
		Crawler.get_website_atlas
		render layout: false		
	end
end