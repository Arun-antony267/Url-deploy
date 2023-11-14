require "rails_helper"

RSpec.describe "UserLoginAndSignup" do
    user_params = {email: "kiran@gmail.com", password: "123", name: "kiran"}

    describe "GET create" do
        it "from a create user" do
          @user = User.create(user_params)
           user_check = @user.save
           
          # post :create, params: user_params   
          # user = build(:user)
          # post :create, FactoryBot.create(:user)        
          # expect(flash[:message]).to eq("Your Account was Created Successfully")

          expect(user_check).to eq(true)
        end
    end


  describe "GET Login" do
    it "from a login user" do
      user_params = {email: 'iop@io.com', password: '123' }
      @user = User.create(user_params)
      user_check = User.find_by(email: 'iop@io.com')
      user = user_check.present?

      # post :check_login, params:{email: 'iop@io.com', password: '123' }
      # user = FactoryBot.create(user: user_params)
      # post :check_login, (user)

      expect( user).to eq(true)
    end
  end
 end
