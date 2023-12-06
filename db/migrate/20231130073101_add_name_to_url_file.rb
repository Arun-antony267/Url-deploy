class AddNameToUrlFile < ActiveRecord::Migration[7.0]
  def change
    add_column :url_files, :name, :string
  end
end
