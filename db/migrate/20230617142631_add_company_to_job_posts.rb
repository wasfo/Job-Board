class AddCompanyToJobPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :job_posts, :company, :string
    add_column :job_posts, :contact, :integer
  end
end
