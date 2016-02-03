class AddNameToCompaniess < ActiveRecord::Migration
  def change
    add_column :companies, :crawler_id, :integer
    add_column :companies, :crawler_url, :string
  end
end
