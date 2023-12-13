class AddUserIdToShortUrl < ActiveRecord::Migration[7.0]
  def change
    add_column :short_urls, :user_id, :integer
  end
end
