class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :noteable, polymorphic: true
      t.references :user
      t.text :body

      t.timestamps
    end
    add_index :notes, :user_id
    add_index :notes, :noteable_id
  end
end
