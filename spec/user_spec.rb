require "user"
require_relative "database_helpers"
describe User do
  describe ".create" do
    it "creats a new user" do
      user = User.create(email: "alex@gmail.com", password: "password")

      persisted_data = persisted_data(id: user.id, table: "users")

      expect(user).to be_a User
      # expect(user.id).to eq persisted_data["id"]
      expect(user.email).to eq "alex@gmail.com"
    end
  end
end
