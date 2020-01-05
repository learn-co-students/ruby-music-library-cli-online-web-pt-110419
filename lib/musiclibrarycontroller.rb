class MusicLibraryController

  def initialize(path= './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = ""

    until input == 'exit' do
      input = gets.downcase

      case input
        when 'list songs'
          list_songs
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'list artist'
          list_songs_by_artist
        when 'list genre'
          list_songs_by_genre
        when 'play song'
          play_song
      end
    end
  end

  def list_songs
    i = 0
    sortedSongs = Song.all.sort_by{|song| song.name}
    while i < sortedSongs.length
      puts "#{i+1}. #{sortedSongs[i].artist.name} - #{sortedSongs[i].name} - #{sortedSongs[i].genre.name}"
      i += 1
    end
  end

  def list_artists
    i = 0
    sortedArtists = Artist.all.sort_by{|artist| artist.name}
    while i < sortedArtists.length
      puts "#{i+1}. #{sortedArtists[i].name}"
      i += 1
    end
  end

  def list_genres
    i = 0
    sortedGenres = Genre.all.sort_by{|genre| genre.name}
    while i < sortedGenres.length
      puts "#{i+1}. #{sortedGenres[i].name}"
      i += 1
    end
  end

  def list_songs_by_artist
    i = 0
    puts "Please enter the name of an artist:"
    artist = gets
    artist = Artist.find_by_name(artist)
    if artist == nil
      return nil
    else
      songs = artist.songs.sort_by{|song| song.name}
      while i < songs.length
        puts "#{i+1}. #{songs[i].name} - #{songs[i].genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    i = 0
    puts "Please enter the name of a genre:"
    genre = gets
    genre = Genre.find_by_name(genre)
    if genre == nil
      return nil
    else
      songs = genre.songs.sort_by{|song| song.name}
      while i < songs.length
        puts "#{i+1}. #{songs[i].artist.name} - #{songs[i].name}"
        i += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    songNumber = gets.to_i
    sortedSongs = Song.all.sort_by{|song| song.name}
    if songNumber > 0 && songNumber <= sortedSongs.length
      puts "Playing #{sortedSongs[songNumber-1].name} by #{sortedSongs[songNumber-1].artist.name}"
    end
  end
end 
