class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.boolean :seen
      t.integer :job_post_id
      t.integer :user_id
      t.timestamps
    end
  end
end
