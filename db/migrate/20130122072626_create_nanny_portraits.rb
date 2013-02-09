class CreateNannyPortraits < ActiveRecord::Migration
  def change
    create_table :nanny_portraits do |t|
      t.boolean :is_car_provided
      t.boolean :is_car_provided_available_after_hours
      t.datetime :commitment_start_at
      t.datetime :end_at
      t.datetime :start_at
      t.references :family_profile
      t.string :commitment_requirement
      t.text :accommodation_description
      t.text :fit_description
      t.text :job_description
      t.text :qualities_description
      t.text :vacation_description
      t.text :work_hours_description

      t.timestamps
    end
    add_index :nanny_portraits, :family_profile_id
  end
end
