class AddCategoryToShortenedUrl < ActiveRecord::Migration[7.0]
  def change
    add_column :shortened_urls, :category, :string
    add_index :shortened_urls, :category
  end
end
