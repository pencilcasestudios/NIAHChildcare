class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addresseable, polymorphic: true
      t.string :city
      t.string :email
      t.string :phone
      t.string :state
      t.string :zip_code
      t.text :street_address

      t.timestamps
    end
    add_index :addresses, :addresseable_id
  end
end
