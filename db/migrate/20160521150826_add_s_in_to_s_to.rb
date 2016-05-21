class AddSInToSTo < ActiveRecord::Migration
  def change
    add_column :schedules, :s_in, :time
    add_column :schedules, :s_to, :time
  end
end
