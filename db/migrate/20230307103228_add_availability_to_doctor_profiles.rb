class AddAvailabilityToDoctorProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :doctor_profiles, :availability, :date
  end
end
