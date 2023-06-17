class AddCoverletterToJobApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :job_applications, :coverletter, :text
    add_column :job_applications, :email, :string
    add_column :job_applications, :phone, :integer
  end
end
