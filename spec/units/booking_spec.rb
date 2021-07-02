require 'booking'
require './spec/database_helpers'

describe Booking do
    describe ".create" do
        it "saves booking request" do
        
            user = User.create(email: "alex@gmail.com", password: "password")
            property = Property.create(name: "Eastside", description: "Cottage with a garden", location: "LA", price: 150, from_date: '2021-01-15', to_date: '2021-10-19')
            booking = Booking.create(user_id: user.id, property_id: property.id, check_in: '2021-01-15', check_out: '2021-10-19', guests: 3)
            
            persisted_data = persisted_data(id: booking.id, table: "booking")

            expect(booking).to be_a Booking
            expect(booking.id).to eq persisted_data.first["id"]
        end
    end
end
