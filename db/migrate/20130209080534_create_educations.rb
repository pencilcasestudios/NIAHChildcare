class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.boolean :is_a_graduate
      t.datetime :ended_at
      t.datetime :started_at
      t.references :educatable, polymorphic: true
      t.string :name
      t.string :qualification

      t.timestamps
    end
    add_index :educations, :educatable_id
  end
end
