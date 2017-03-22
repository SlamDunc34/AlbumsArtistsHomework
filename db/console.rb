require('pry-byebug')
require_relative('../models/artists')
require_relative('../models/albums')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Bad_Brains'})
artist1.save()

album1 = Album.new({
  'name' => 'Banned_in_DC',
  'artist_id' => artist1.id
})
album1.save()



binding.pry
nil
