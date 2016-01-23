class AddCurrencyIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :currency_id, :integer
    add_column :companies, :unit, :integer
  end
end
