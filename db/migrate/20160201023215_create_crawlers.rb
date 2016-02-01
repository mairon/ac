class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.integer :company_id
      t.text :content

      t.timestamps null: false
    end
  end
end
