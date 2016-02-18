class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :email, limit: 40
      t.timestamps null: false
    end
  end
end
