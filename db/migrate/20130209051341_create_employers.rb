class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.datetime :ended_at
      t.datetime :started_at
      t.references :employable, polymorphic: true
      t.string :name
      t.string :supervisor_name
      t.text :reason_for_leaving

      t.timestamps
    end
    add_index :employers, :employable_id
  end
end
