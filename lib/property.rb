require 'pg'

class Property
  
  attr_reader :name, :description, :location, :price, :id, :from_date, :to_date
  
  def initialize(name:, description:, location:, price:, id:, from_date:, to_date:)
    @name = name
    @description = description
    @location = location
    @price = price
    @id = id
    @from_date = from_date
    @to_date = to_date
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
      location: property['location'], price: property['price'].to_i, from_date: property['from_date'], to_date: property['to_date'])
    end

  end

  def self.create(name:, description:, location:, price:, from_date:, to_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO property (name, description, location, price, from_date, to_date) VALUES ('#{name}', '#{description}', '#{location}', '#{price}', '#{from_date}', '#{to_date}') 
    RETURNING id, name, description, location, price, from_date, to_date;")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], 
    location: result[0]['location'], price: result[0]['price'].to_i, from_date: result[0]['from_date'], to_date: result[0]['to_date'])
    # p result
  end

end
