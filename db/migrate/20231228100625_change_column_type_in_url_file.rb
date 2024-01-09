class ChangeColumnTypeInUrlFile < ActiveRecord::Migration[7.0]
  def change
    change_column :url_files, :job_id, :string

  end
end
