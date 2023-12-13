require 'rails_helper'
require 'uri'

value = rand.to_s[0..6]

RSpec.describe "RegistrationHelper" do

        it "validates Registration" do
                email = "jon@kinney.com"
                expect(email =~ URI::MailTo::EMAIL_REGEXP)
        end

        it "Validate original URL" do
       
                url = "https://www.favouritewebsite.com/articles/coustemer-satisfaction"
                expect(url =~ /\A#{URI::regexp([ 'http', 'https'])}\z/ )
        end

        it "checks generated lookup code is oof length 7" do
        
                        lookup_code = value 
                        expect(lookup_code.length).to eq(7)
        end
        
    
        it "shortens a given URL with a 7 character lookup code " do
       
                        url = "https://www.favouritewebsite.com/articles/coustemer-satisfaction"
                        shortener = "https://test.tin.ee/"+value
                        expect(shortener).to eq("https://test.tin.ee/"+value) 
        end
                       

                       
        it "gives each URL its own lookup code " do
                       
                         url = "https://www.favouritewebsite.com/articles/coustemer-satisfaction"
                         shortener = rand.to_s[0..6]
                         code_1 = shortener
                       
                         url = "https://www.favouritewebsite.com/articles/coustemer-satisfaction"
                         shortener = rand.to_s[0..6]
                         code_2 = shortener
                       
                         expect(code_2).not_to eq(code_1)
        end
end

