class Admin::PainelController < AdminController	
	def index
		#Crawler.get_website_atlas
		mechanize = Mechanize.new
		page = mechanize.get('http://www.mercosurcambios.com/cotizaciones/1/matriz-centro')
		@get_val = page.search(".//td")

		render layout: false		
	end
end