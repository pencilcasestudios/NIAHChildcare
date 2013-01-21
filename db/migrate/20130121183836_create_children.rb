class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :full_name
      t.datetime :born_at
      t.text :interests_description
      t.text :special_needs_description
      t.references :family_profile

      t.timestamps
    end
    add_index :children, :family_profile_id
  end
end
