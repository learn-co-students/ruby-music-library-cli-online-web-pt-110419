require "pry"

class MusicLibraryController
   def initialize(path= "./db/mp3s") 
    
    session = MusicImporter.new(path)  
    session.import 
 
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
    user_response = gets.chomp
    while user_response != "exit"
        
        if user_response == "list songs"
            list_songs
        end
        user_response= gets.chomp
    end
   end

   def list_songs
    song_list = Song.all.sort_by {|song|  song.name}

    song_list.uniq.collect.with_index {|song, index|
        puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
    song_list
   end

   def list_artists
    artist_list = Artist.all.uniq.sort_by{|artist| artist.name}

    artist_list.each_with_index { |artist, index|
        puts "#{index +1}. #{artist.name}"
    }
   end

   def list_genres 
    genre_list = Genre.all.uniq.sort_by {|genre| genre.name}


    genre_list.each_with_index {|genre, index|
        puts "#{index + 1}. #{genre.name}"
    }
   end

   def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp

    user_artist_songs = Song.all.select {|song| 
        song.artist.name == user_input    
    }
     
    user_artist_songs = user_artist_songs.uniq.sort_by {|song| song.name}

    user_artist_songs.each_with_index {|song,index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    } 
   end

   def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp

    song_list = Song.all.uniq.select {|song| 
        song.genre.name == user_input
    }

    song_list = song_list.sort_by {|song|  
        song.name
    }

    song_list.each_with_index {|song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    }

   end

   def play_song
    puts "Which song number would you like to play?"
    user_input = gets

    song_list = Song.all.uniq.sort_by {|song|  song.name}

    if user_input.to_i != 0 && user_input.to_i < song_list.count
        choice = song_list[user_input.to_i - 1]
        puts "Playing #{choice.name} by #{choice.artist.name}"
    end
    
    #***************** DID NOT WORK*************
    # if user_input.to_i != 0

    #     choices= list_songs.uniq
    #     matched_song = choices[user_input.to_i - 1]
    
    #     song = "Playing #{matched_song.name} by #{matched_song.artist.name}"
    # end     
   end





end