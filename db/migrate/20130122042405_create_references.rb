class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.datetime :known_since
      t.references :referenceable, polymorphic: true
      t.string :full_name
      t.string :relationship

      t.timestamps
    end
    add_index :references, :referenceable_id
  end
end
