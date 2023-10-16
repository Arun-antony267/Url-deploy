class Url < ApplicationRecord 
validates_presence_of :lookup_code, :orginal_url
validates_uniqueness_of :lookup_code
validate :original_url_format 

def original_url_format
    uri = URI.parse(orginal_url || "")
    if uri.host.nil?
        errors.add(:original_url, "Invalid URL format")
    end
end
end 