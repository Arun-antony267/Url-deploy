require 'rails-helper'
require 'uri'

RSpec.describe "RegistrationHelper" do

        it "validates Registration" do
        email = "jon@kinney.com"
        expect(email =~ URI::MailTo::EMAIL_REGEXP)
        end

    
end
