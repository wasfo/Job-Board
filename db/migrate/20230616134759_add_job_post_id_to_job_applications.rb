class AddJobPostIdToJobApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :job_applications, :job_post_id, :integer
  end
end

# add_column :job_applications, :job_post_id, :integer
# add_column :job_applications, :user_id, :integer
#