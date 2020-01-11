require 'pry'

class Song
  extend Concerns::Findable
    attr_accessor :name, :genre
    attr_reader :artist
    
    @@all = []
    
  
    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
      save
    end
    
    
    def self.all
      @@all
    end
    
    def self.destroy_all
      @@all.clear
    end
    
    def save
      self.class.all << self
    end
    
    def self.create(song)
      new_song = self.new(song)
      new_song
      #binding.pry
    end
    
    def artist=(artist)
      @artist = artist
      artist.add_song(self)
      #binding.pry
    end
    
    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end
    
    # def self.find_by_name(name)
    #   all.detect {|song| song.name == name}
    # end
    
    # def self.find_or_create_by_name(song_name)
    #   find_by_name(song_name) || create(song_name)
    # end
    
    def self.new_from_filename(file_name)
      song = file_name.split(" - ")
      song_name = song[1]
      artist_name = song[0]
      song_genre = song[2].gsub(".mp3", "")
      song_genre = Genre.find_or_create_by_name(song_genre)
      artist_name = Artist.find_or_create_by_name(artist_name)
      new_song = self.new(song_name,artist_name,song_genre)
      #binding.pry
    end
    
    def self.create_from_filename(file)
      self.new_from_filename(file)
    end
  end