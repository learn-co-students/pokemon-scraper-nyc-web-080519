class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(num, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL
        array = db.execute(sql, num).flatten
        Pokemon.new(id: array[0], name: array[1], type: array[2], db: db)
    end
end
