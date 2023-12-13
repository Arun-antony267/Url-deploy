require "rails_helper"

RSpec.describe "UserLoginAndSignup" do
  describe "GET create" do
    it "from create user" do
      user_params = { email: "Achilles@gmail.com", password: "123", created_at: Time.now, updated_at: Time.now, name: "Achilles" }
      @user = User.create(user_params)
      user_check = @user.present?
      expect(user_check).to eq(true)
    end
  end

  describe "GET create" do
    it "user with invalid params" do
      invalid_params = { email: "Ibrahim@gmail.com", password: "", name: "" }
      @user = User.create(invalid_params)
      user_validate = @user.save

      expect(user_validate).to eq(false)
    end
  end

  describe "GET Login" do
    it "from a login user" do
      user_check = User.find_by(email: "kiran@gmail.com")
      user = user_check.present?

      expect(user).to eq(true)
    end
  end

  describe "GET login" do
    it "invalid user login try" do
      user = User.find_by(email: "")
      user_validate = user.present?

      expect(user_validate).to eq(false)
    end
  end
end
