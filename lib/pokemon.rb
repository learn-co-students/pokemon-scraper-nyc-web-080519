class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db: )
    @id = id 
    @name = name 
    @type = type 
    @db = db 
  end 

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    poke_attr = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: poke_attr[0], name: poke_attr[1], type: poke_attr[2], db: db)
  end

  # def self.save(name, type, db)
  #   sql = <<-SQL
  #     INSERT INTO pokemon (name, type)
  #     VALUES (?, ?); 
  #   SQL
  #    DB[:conn].execute(sql, self.name, self.type)
  # end


end #end of pokemon class
