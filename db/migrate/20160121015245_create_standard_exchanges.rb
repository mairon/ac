class CreateStandardExchanges < ActiveRecord::Migration
  def change
    create_table :standard_exchanges do |t|
      t.integer :currency_want
      t.integer :currency_have
      t.integer :operation

      t.timestamps null: false
    end
  end
end
