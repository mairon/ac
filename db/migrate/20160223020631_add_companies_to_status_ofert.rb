class AddCompaniesToStatusOfert < ActiveRecord::Migration
  def change
    add_column :companies, :status_ofert, :boolean, default: false
  end
end
