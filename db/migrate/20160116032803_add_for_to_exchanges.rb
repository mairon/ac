class AddForToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :for, :integer
  end
end
