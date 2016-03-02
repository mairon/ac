class AddStatusScheduleServiceToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :status_schedule_service, :boolean, default: false
  end
end
