class CreateFamilyProfiles < ActiveRecord::Migration
  def change
    create_table :family_profiles do |t|
      t.references :user

      t.text :best_time_to_contact
      t.text :interests_description
      t.text :pets_description

      t.timestamps
    end
    add_index :family_profiles, :user_id
  end
end
