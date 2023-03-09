class AddCoordinatesToDoctorProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :doctor_profiles, :latitude, :float
    add_column :doctor_profiles, :longitude, :float
  end
end
