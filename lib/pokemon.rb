class Pokemon
    attr_accessor :id, :db
    attr_reader :name, :type

    def initialize(id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end
    
    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        # we do not need to do db[:conn] because we initialized Pokemon with db
        # don't forget to put the arguments name and type when we db.execute!!
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        # create a sql query to find the pokemon
        # db.execute than flatten the nested array
        # now we can get the necessary information to create a new pokemon
        # return the created pokemon
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
        SQL
        pokemon = db.execute(sql, id).flatten
        p_id = pokemon[0]
        p_name = pokemon[1]
        p_type = pokemon[2]
        found = Pokemon.new(id: p_id, name: p_name, type: p_type, db: db)
    end
end
