class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, limit: 40
      t.integer :set_type
      t.string :email, limit: 50
      t.string :telephone, limit: 20
      t.text :mensagem
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
