class Booking

    attr_reader :id, :user_id, :property_id, :checkin, :checkout, :guests

    def initialize(id:, user_id:, property_id:, check_in:, check_out:, guests:)
        @id = id
        @user_id = user_id
        @property_id = property_id
        @check_in = checkin
        @check_out = checkout
        @guests = guests
    end

    def self.create(user_id:, property_id:, check_in:, check_out:, guests:)
        result = DatabaseConnection.query("INSERT INTO booking (user_id, property_id, check_in, check_out, guests) VALUES
        ('#{user_id}', '#{property_id}', '#{check_in}', '#{check_out}', '#{guests}') RETURNING id, user_id, property_id, check_in, 
        check_out, guests;")

        Booking.new(
            id: result[0]['id'],
            user_id: result[0]['user_id'],
            property_id: result[0]['property_id'],
            check_in: result[0]['check_in'],
            check_out: result[0]['check_out'],
            guests: result[0]['guests']
            )
    end

end