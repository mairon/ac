class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, limit: 50

      t.timestamps null: false
    end
  end
end
