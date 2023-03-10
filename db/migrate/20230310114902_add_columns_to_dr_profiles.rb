class AddColumnsToDrProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :doctor_profiles, :bio, :string
    add_column :doctor_profiles, :practice_hours, :string
    add_column :doctor_profiles, :qualifications, :string
    add_column :doctor_profiles, :reviews, :string
  end
end
