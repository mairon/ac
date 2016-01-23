class AddDecimalCurrencies < ActiveRecord::Migration
  def change
  	add_column :currencies, :dec, :integer, default: 0
  end
end
