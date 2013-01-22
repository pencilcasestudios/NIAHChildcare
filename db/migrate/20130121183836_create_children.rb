class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.datetime :born_at
      t.references :family_profile
      t.string :full_name
      t.text :gender
      t.text :interests_description
      t.text :special_needs_description

      t.timestamps
    end
    add_index :children, :family_profile_id
  end
end
