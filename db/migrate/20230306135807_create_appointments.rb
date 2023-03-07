class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :user, null: false, foreign_key: true
      t.references :doctor_profile, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
