class AddJobIdtoShourtUrl < ActiveRecord::Migration[7.0]
  def change
    add_column :short_urls, :job_id, :integer
  end
end
