class AddTelefone02ToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :telephone02, :string, limit: 20
  end
end
