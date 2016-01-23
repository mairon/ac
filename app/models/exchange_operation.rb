class ExchangeOperation < ActiveRecord::Base
	belongs_to :company


	def self.crawler_auto
		Exchange.create(company_id: 4, date: '2015-01-24', currency_id: 1, for: 2)

	end
end
