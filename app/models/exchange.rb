class Exchange < ActiveRecord::Base
	belongs_to :currency
	has_many :exchange_operations, dependent: :destroy
	after_save :generating_operations

	def generating_operations
		ExchangeOperation.destroy_all("exchange_id = #{self.id}")
		#primeira consulta baseada na moeda padrao
		current_search = StandardExchange.find_by currency_have: self.currency_id, currency_want: self.for
		if current_search.operation.to_i == 0
			current_amount = self.buy
		else
			current_amount = self.sale
		end
		#segunda consulta inversa
		reverse_search = StandardExchange.find_by currency_have: self.for, currency_want: self.currency_id
		if reverse_search.operation.to_i == 0
			reverse_amount = self.buy
		else
			reverse_amount = self.sale
		end

		ExchangeOperation.create(active: true, exchange_id: self.id, company_id: self.company_id, 
			have_id: self.currency_id, want_id: self.for, operation: current_search.operation, amount: current_amount.to_f )
		ExchangeOperation.create(active: true, exchange_id: self.id, company_id: self.company_id, 
			have_id: self.for, want_id: self.currency_id, operation: reverse_search.operation, amount: reverse_amount.to_f )
	end
end
