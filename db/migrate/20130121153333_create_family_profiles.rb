class CreateFamilyProfiles < ActiveRecord::Migration
  def change
    create_table :family_profiles do |t|
      t.text :pets_description
      t.text :interests_description
      t.references :user

      t.timestamps
    end
    add_index :family_profiles, :user_id
  end
end
