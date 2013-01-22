class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :full_name
      t.datetime :known_since
      t.string :relationship
      t.references :referenceable, polymorphic: true

      t.timestamps
    end
    add_index :references, :referenceable_id
  end
end
