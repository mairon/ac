class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :company_id
      t.integer :currency_id
      t.date :date
      t.decimal :buy, :scale => 2, :precision => 15, :default => 0
      t.decimal :sale, :scale => 2, :precision => 15, :default => 0

      t.timestamps null: false
    end
  end
end
