class AddOdToStandardExchanges < ActiveRecord::Migration
  def change
    add_column :standard_exchanges, :od, :integer, default: 0
  end
end
