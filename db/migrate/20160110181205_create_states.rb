class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, limit: 50
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
