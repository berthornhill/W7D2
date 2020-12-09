require 'rails_helper'

RSpec.describe User, type: :model do

  
  describe "validations" do
    it {should validate_presence_of(:email) }
    it {should validate_presence_of(:password_digest) }
    it {should validate_length_of(:password).is_at_least(6).on(:create)}
  end

  describe "User methods" do

    user = User.create!(email: "valid@email", password: "starwars")

      describe "User#is_password?" do
        it "checks user's input password against password_digest" do
                  
          expect(user.is_password?("starwars")).to be true
          expect(user.is_password?("stardoors")).to be false   
        end
      end

      describe "User#reset_session_token!" do
        it "resets session token" do
          token = user.session_token
          expect(user.reset_session_token!).not_to be(token)
        end
      end

      describe "User::find_by_credentials" do
        it "finds a user using passed in arguments, email and password" do
          
          expect(User.find_by_credentials("valid@email", "starwars")).to eq(user)
        end
      end


  end

end

user = User.new(email: "valid@email", password: "password")