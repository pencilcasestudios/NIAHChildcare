class AddJobTitleToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :job_title, :string
  end
end
