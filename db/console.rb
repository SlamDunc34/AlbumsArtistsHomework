require('pry-byebug')
require_relative('../models/artists')
require_relative('../models/albums')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Bad_Brains', 'genre' => 'Hardcore'})
artist2 = Artist.new({'name' => 'Kyuss', 'genre' => 'Desert_Punk'})

artist1.save()
artist2.save()

album1 = Album.new({
  'name' => 'Banned_in_DC',
  'artist_id' => artist1.id
})
album2 = Album.new({
  'name' => 'Wretch',
  'artist_id' => artist2.id
})
album3 = Album.new({
  'name' => 'Sky_Valley',
  'artist_id' => artist2.id
})

album1.save()
album2.save()
album3.save()



binding.pry
nil
