require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name, :genre

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO artists(
    name, 
    genre
    ) VALUES (
    '#{@name}',
    '#{@genre}'
    )
    RETURNING *"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map {|artist| Artist.new(artist)}
    return artists
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run(sql)
    albums = result.map { |album| Album.new(album)}
    return albums
  end

end

