class ShortUrl < ApplicationRecord
  validates_presence_of :shortened_url, :original_url, :user_id
  validates_uniqueness_of :shortened_url
end
