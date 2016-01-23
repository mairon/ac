class AddAvatarToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :avatar_file_name, :string, limit: 50
    add_column :companies, :avatar_content_type, :string, limit: 20
    add_column :companies, :avatar_file_size, :integer
    add_column :companies, :avatar_updated_at, :datetime
  end
end
