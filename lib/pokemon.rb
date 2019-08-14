class Pokemon
    attr_reader :id, :db
    attr_accessor :name, :type

    def initialize(attributes)
        @id = attributes[:id]
        @name = attributes[:name]
        @type = attributes[:type]
        @db = attributes[:db]
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id_number, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE pokemon.id = ?
        SQL
        db.execute(sql, id_number).map do |row|
            self.new_from_db(row)
        end.first
    end

    def self.new_from_db(row)
        Pokemon.new(id: row[0], name: row[1], type: row[2], db: row[3])
    end
end
