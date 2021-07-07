require 'pry'
class MusicLibraryController

attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    new_music_importer = MusicImporter.new(path)
    new_music_importer.import

    # binding.pry
  end

  def call
    input = ''
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip

    case input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    end
  end
end

  def list_songs
    # cannot hard code puts
    # how can I retrieve the song name artist name and genre
    # where are they located? In the objects
    # where are the objects located
    # how do I access the values of the objects
    # how do I puts the values of the objects
    Song.all.sort {|a,b| a.name <=> b.name}.uniq.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}

  end

  def list_artists
    Artist.all.sort {|a,b| a.name <=> b.name}.uniq.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort {|a,b| a.name <=> b.name}.uniq.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    # get users input
    if artist = Artist.find_by_name(input)
    # match users input to existing object within array if findable. If not do nothing
      # binding.pry
    artist.songs.sort {|a,b| a.name <=> b.name}.uniq.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
  end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
    genre.songs.sort {|a,b| a.name <=> b.name}.uniq.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
  end
end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    users_input_matches_with_song_position = (1..Song.all.length).include?(input)
  #   # if the number within Song.all matches users_input then puts
    if users_input_matches_with_song_position
  #     # song = list_of_the_song[input]
    song = Song.all.sort {|a,b| a.name <=> b.name}.uniq[input - 1]
    puts "Playing #{song.name} by #{song.artist.name}"

  end
  #
  # end
    # what does this method want me to do?
    # play the song from list_songs that matches the user's input
    # how do I match users input to list_songs
    # how do I match the number provided by the user to the number of the song in the list
    # array can store infinite amount of songs so users input isn't finite it also can be infinite which means we need to use a range
    # how do I use a range and compare it to something else to return a comparison value

    #  binding.pry
  end

end

#initialize the 'path' argument defaults to './db/mp3s'
