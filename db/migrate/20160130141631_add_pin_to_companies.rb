class AddPinToCompanies < ActiveRecord::Migration
  def change
    add_attachment :companies, :pin
  end
end
