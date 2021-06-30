require 'pg'

def persisted_data(id:)
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.query("SELECT * FROM property WHERE id = '#{id}';")
end