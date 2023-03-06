class CreateDoctorProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_profiles do |t|
      t.string :specialty
      t.string :practice_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
