require 'pg'

class Property
  
  attr_reader :name, :description, :location, :price, :id
  
  def initialize(name:, description:, location:, price:, id:)
    @name = name
    @description = description
    @location = location
    @price = price
    @id = id
  end
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM property;")
    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], description: property['description'], 
      location: property['location'], price: property['price'].to_i)
    end
  end
  def self.create(name:, description:, location:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO property (name, description, location, price) VALUES ('#{name}', '#{description}', '#{location}', '#{price}') 
    RETURNING id, name, description, location, price;")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], 
    location: result[0]['location'], price: result[0]['price'].to_i)
    # p result
  end
end
