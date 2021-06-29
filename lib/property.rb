require 'pg'

class Property
  def self.all
    connection = PG.connect(dbname: 'makersbnb_test')
    result =connection.exec("SELECT * FROM property;")
    result.map { |property| property['name'] }
  end
  def self.create(name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO property (name) VALUES ('#{name}')")
  end
end
