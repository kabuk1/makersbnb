require "user"
require_relative "database_helpers"
require "setup_test_database"

describe User do
  describe ".create" do
    it "creats a new user" do
      setup_test_database
      user = User.create(email: "alex@gmail.com", password: "password")

      persisted_data = persisted_data(id: user.id, table: "users")

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first["id"]
      expect(user.email).to eq "alex@gmail.com"
    end
  end
  describe ".authenticate" do
    it "returns a user given accurate login details" do
      user = User.create(email: "alex@gmail.com", password: "password")
      authenticate_user = User.authenticate(email: "alex@gmail.com", password: "password")
      expect(authenticate_user.id).to eq user.id
      # Error experienced on line 25.
    end
  end
end
