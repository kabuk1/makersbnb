require 'property'

describe Property do
  describe '.all' do
    it 'returns all properties' do
      properties = Property.all

      expect(properties).to include("Riverside")
      expect(properties).to include("Lakeside")
      expect(properties).to include("Oceanside")
    end
  end
end