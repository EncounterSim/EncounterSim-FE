require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it "should validate a standard user" do
      standard_user = User.create(username: "newusername", email: "test@gmail.com")
      expect(standard_user).to validate_presence_of(:username)
      expect(standard_user).to validate_presence_of(:email)
      expect(standard_user).to validate_uniqueness_of(:username)
      expect(standard_user).to validate_uniqueness_of(:email)
    end
    
    it "should validate a github user" do
      github_user = User.create(username: "githubuser", email: nil, uid: 15794613, token: 23425235)
      expect(github_user).to validate_presence_of(:username)
    end
  end

  describe "class methods" do
    describe "#find_user_for_magic_link" do
      it "should find a user if they have a current login token that is less than 60 minutes old" do
        user = User.create(username: "jojo", email: "jojo@gmail.com", password: "3123434", login_token: "123453461454", login_token_valid_until: Time.now + 60.minutes)
        params = {
          login_token: "123453461454"
        }
        query = User.find_user_for_magic_link(params)
        expect(query).to eq(user)
      end
    end
  end
end