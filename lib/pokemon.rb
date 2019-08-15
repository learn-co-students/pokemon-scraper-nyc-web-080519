class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id
    require 'pry'

    def initialize(name:, type:, db:, id:)
        @name = name#params[name]
        @type = type#params[type]
        @db = db#params[db]
        @id = id#params[id]
    end

    def self.save(this_name, this_type, this_db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES(?, ?)
        SQL
        this_db.execute(sql, this_name, this_type)
        @id = this_db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, this_db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
        SQL
        result = this_db.execute(sql, id)[0]
        new_pokemon = Pokemon.new(:id => result[0], :name => result[1], :type => result[2], :db => this_db)
        new_pokemon
    end

end
