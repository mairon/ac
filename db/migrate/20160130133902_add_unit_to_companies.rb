class AddUnitToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_id, :integer, default: 0
  end
end
