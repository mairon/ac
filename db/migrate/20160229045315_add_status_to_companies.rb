class AddStatusToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :status, :boolean, default: true
  end
end
