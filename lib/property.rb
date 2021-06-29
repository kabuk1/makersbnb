require 'pg'

class Property
  def self.all
    connection = PG.connect(dbname: 'makersbnb_test')
    result =connection.exec("SELECT * FROM property;")
    result.map { |property| property['name'] }
  end
end