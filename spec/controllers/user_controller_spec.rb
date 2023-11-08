require "rails_helper"

  RSpec.describe UserController, type: :controller do
   
   describe "GET /create" do 

    context "from login user" do
      it "should return 200:OK" do

        get :signup
        user = FactoryBot.create(User.new(email: 'ashwathy@gmail.com', password_digest: '123'))
        expect(response).to have_http_status(:success)
      end
    end
  end


  describe "GET Login" do
    it "Should return 200:OK" do
      
      get :check_login
      user = FactoryBot.create(:user)
      expect(response).to have_http_status(:success)
    end
  end
 end