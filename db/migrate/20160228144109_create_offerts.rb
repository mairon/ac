class CreateOfferts < ActiveRecord::Migration
  def change
    create_table :offerts do |t|
      t.integer :company_id
      t.decimal :have, scale: 4, precision: 15, default: 0
      t.decimal :exchange, scale: 4, precision: 15, default: 0
      t.integer :status, default: 0
      t.integer :user_id
      t.text :obs

      t.timestamps null: false
    end
  end
end
