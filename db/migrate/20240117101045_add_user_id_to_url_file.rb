class AddUserIdToUrlFile < ActiveRecord::Migration[7.0]
  def change
    add_column :url_files, :user_id, :integer
  end
end
