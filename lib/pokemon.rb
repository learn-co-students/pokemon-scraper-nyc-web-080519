class Pokemon

    def initialize(id=nil, name, type)
        @id = id
        @name = name
        @type = type
    end


    def self.create
        pokemon = self.pokemon(name, type)
        pokemon.save
    end

    def save
        sql = << -SQL
            INSERT INTO pokemons(name, type) VALUES (?, ?)
        SQL
        DB[:conn].execute(sql, self.name, self.type)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0] 
    end

    def find
    
    end

end
