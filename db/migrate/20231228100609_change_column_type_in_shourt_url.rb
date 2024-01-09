class ChangeColumnTypeInShourtUrl < ActiveRecord::Migration[7.0]
  def change
    change_column :short_urls, :job_id, :string

  end
end
