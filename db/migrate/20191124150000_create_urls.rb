class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :lookup_code,null: false
      t.string :orginal_url
      t.timestamps
    end
  end
end