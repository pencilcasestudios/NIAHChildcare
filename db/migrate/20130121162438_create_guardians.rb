class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :role
      t.string :full_name
      t.string :occupation
      t.references :family_profile

      t.timestamps
    end
    add_index :guardians, :family_profile_id
  end
end
