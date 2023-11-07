require 'rails_helper'
require "uri"

RSpec.describe "Original Url" do
    
 it "Validate original URL" do

 url = "https://www.favouritewebsite.com/articles/coustemer-satisfaction"
 expect(url) =~ /\A#{URI::regexp([ 'http', 'https'])}\z/ 
 end

end 

