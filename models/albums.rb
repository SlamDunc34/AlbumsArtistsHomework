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

  def self.all()
    sql = "SELECT * FROM albums;"
    result =SqlRunner.run(sql)
    albums = result.map { |album_hash| Album.new(album_hash) }
    return albums
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@id}"
    result =SqlRunner.run(sql)
    artist = Artist.new(result.first)
    return artist
  end

end