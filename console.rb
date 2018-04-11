require("pry-byebug")
require_relative("models/albums.rb")
require_relative("models/artists.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Bastille"
  })

  artist1.save()

  artist2 = Artist.new({
    "name" => "Oasis"
    })
    artist2.save()

    album1 = Album.new({
      "title" => "Bad Blood",
      "genre" => "Indie",
      "artist_id" => artist1.id
      })
        album1.save()
      album2 = Album.new({
        "title" => "Wide World",
        "genre" => "Indie",
        "artist_id" => artist1.id
        })
          album2.save()

        album3 = Album.new({
          "title" => "Whats the story morning glory",
          "genre" => "Brit Pop",
          "artist_id" => artist2.id
          })
            album3.save()

          binding.pry
          nil
