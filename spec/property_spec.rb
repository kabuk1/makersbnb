require 'property'
require 'database_helpers'

describe Property do
  describe '.all' do
    it 'returns all properties' do
      connection = PG.connect(dbname: 'makersbnb_test')
      
      property = Property.create(name: "Riverside", description: "Cabin with a river view", location: "River City", price: 100)
      Property.create(name: "Lakeside", description: "Cabin on the lake with a boat", location: "Lake City", price: 150)
      Property.create(name: "Oceanside", description: "Studio on the beach", location: "Ocean City", price: 200)

      properties = Property.all

      expect(properties.length).to eq 3
      expect(properties.first).to be_a Property
      expect(properties.first.id).to eq property.id
      expect(properties.first.name).to eq "Riverside"
      expect(properties.first.description).to eq "Cabin with a river view"
      expect(properties.first.location).to eq "River City"
      expect(properties.first.price).to eq 100
    end
  end

  describe '.create' do
    it 'creates the property listing' do
      property = Property.create(name: 'Hillside', description: 'Chalet with a mountain view', location: 'Hull', price: 60)
      persisted_data = persisted_data(id: property.id)

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data.first['id']
      expect(property.name).to eq "Hillside"
      expect(property.description).to eq "Chalet with a mountain view"
      expect(property.location).to eq "Hull"
      expect(property.price).to eq 60
    end
  end

end
