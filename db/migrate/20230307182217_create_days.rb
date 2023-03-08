class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.date :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
