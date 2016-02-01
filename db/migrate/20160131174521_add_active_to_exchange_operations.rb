class AddActiveToExchangeOperations < ActiveRecord::Migration
  def change
    add_column :exchange_operations, :active, :boolean, boolean: false
  end
end
