class AddUserIdToJobApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :job_applications, :user_id, :integer
  end
end
