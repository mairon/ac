class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :in
      t.time :to
      t.string :weekday

      t.timestamps null: false
    end
  end
end
