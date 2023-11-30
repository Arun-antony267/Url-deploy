class CreateUrlFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :url_files do |t|

      t.timestamps
    end
  end
end
