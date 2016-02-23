class AddAddressToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :address_view, :string, limit: 80
  end
end
