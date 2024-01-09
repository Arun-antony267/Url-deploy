class AddJobIdtoUrlfile < ActiveRecord::Migration[7.0]
  def change
    add_column :url_files, :job_id, :integer
  end
end
