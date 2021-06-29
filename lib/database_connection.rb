require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @conn = PG.connect(dbname: dbname)
  end

  def self.connection
    @conn
  end

  def self.query(sql, dbname)
    @conn = PG.connect(dbname: dbname)
    @conn.exec(sql)
  end
end