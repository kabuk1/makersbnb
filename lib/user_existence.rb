require_relative "database_connection"
require "app"

def exists?
  result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    unless result.any?
     return false
    else
     return true
    end
end
