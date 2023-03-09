class AddDoctorsNoteToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :doctor_note, :text
  end
end
