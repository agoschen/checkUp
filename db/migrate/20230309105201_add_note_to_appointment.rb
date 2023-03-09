class AddNoteToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :note, :text
  end
end
