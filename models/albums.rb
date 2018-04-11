require("pg")
require_relative("artists.rb")
require_relative("../db/sql_runner.rb")



class Album

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @title = options["title"]
    @id = options["id"].to_i
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
      sql = "SELECT * FROM albums"
      albums = SqlRunner.run(sql)
      return albums.map {|album| self.new(album)}
  end

  def artist()
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [@artist_id]
      result = SqlRunner.run(sql,values)
      result_hash = result[0]
      return Artist.new(result_hash)
  end


end
