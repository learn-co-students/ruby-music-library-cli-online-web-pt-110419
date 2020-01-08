class Song
  require_relative "../lib/concerns/findable.rb"
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre, :musicimporter
  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
   split = filename.split(" - ")
   song_name = split[1]
   artist = Artist.find_or_create_by_name(split[0])
   genre = Genre.find_or_create_by_name(split[2].gsub(".mp3", ""))
   self.new(song_name, artist, genre)
 end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
