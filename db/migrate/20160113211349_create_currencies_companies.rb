class CreateCurrenciesCompanies < ActiveRecord::Migration
  def change
    create_table :companies_currencies do |t|
      t.integer :company_id
      t.integer :currency_id
      t.timestamps null: false
    end
  end
end
