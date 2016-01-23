class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name, limit: 20
      t.string :short, limit: 5

      t.timestamps null: false
    end
  end
end
