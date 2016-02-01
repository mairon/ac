class StandardExchange < ActiveRecord::Base
	
  validates_presence_of :currency_want, :operation
end
