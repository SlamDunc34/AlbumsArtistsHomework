require('pg')
require_relative('../db/sql_runner')

class Album

  attr_reader :id, :artist_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO albums (
      name,
      artist_id
    ) VALUES (
      '#{@name}',
      #{@artist_id}
    )
    RETURNING id;"
    # puts "**************"
    # puts sql
    # puts "*****************"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end