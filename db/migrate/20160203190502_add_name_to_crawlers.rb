class AddNameToCrawlers < ActiveRecord::Migration
  def change
    add_column :crawlers, :name, :string
  end
end
