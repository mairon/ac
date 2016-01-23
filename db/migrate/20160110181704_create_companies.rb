class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, limit: 50
      t.string :telephone, limit: 20
      t.string :longitude, limit: 20
      t.string :latitude, limit: 20
      t.integer :city_id
      t.integer :country_id
      t.integer :state_id
      t.text :about
      t.string :address, limit: 50
      t.string :website, limit: 150
      t.integer :schedule_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
