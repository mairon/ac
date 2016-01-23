class CreateExchangeOperations < ActiveRecord::Migration
  def change
    create_table :exchange_operations do |t|
      t.integer :exchange_id
      t.integer :company_id
      t.integer :have_id
      t.integer :want_id
      t.integer :operation
      t.decimal :amount, :scale => 4, :precision => 15, :default => 0

      t.timestamps null: false
    end
  end
end
