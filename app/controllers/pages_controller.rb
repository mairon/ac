class PagesController < ApplicationController
	
	def index
		render layout: "page"	
	end

	def search
		@companies = ExchangeOperation.where("have_id = ? and want_id = ?", params[:have], params[:want]).order('amount desc')
		render layout: "page_search"	
	end
end