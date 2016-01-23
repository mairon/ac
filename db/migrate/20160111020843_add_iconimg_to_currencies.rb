class AddIconimgToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :icon_file_name, :string, limit: 50
    add_column :currencies, :icon_content_type, :string, limit: 20
    add_column :currencies, :icon_file_size, :integer
    add_column :currencies, :icon_updated_at, :datetime
  end
end
