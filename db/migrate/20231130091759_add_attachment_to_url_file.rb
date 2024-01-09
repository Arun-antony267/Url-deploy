class AddAttachmentToUrlFile < ActiveRecord::Migration[7.0]
  def change
    add_column :url_files, :attachment, :string
  end
end
