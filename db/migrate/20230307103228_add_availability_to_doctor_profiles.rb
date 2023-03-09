class AddAvailabilityToDoctorProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :doctor_profiles, :availability, :date
    # What if we make availability an integer - and then create an array of slots - the availability - would pull from
    # the slots array? you could have 2 arrays - one for unbooked slots, and one for booked slots if you needed the flexibility.
  end
end
