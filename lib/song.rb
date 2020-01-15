require 'pry'

class Song

attr_accessor :name
attr_reader :artist, :genre

@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song
  end

  def artist=(artist)
  @artist = artist
  @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
  #binding.pry
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(song_name)
    @@all.detect { |song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ||  create(song_name)
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    artist = Artist.find_or_create_by_name(song[0])
    song_name = song[1]
    genre = Genre.find_or_create_by_name(song[2].gsub(".mp3", ""))
    new_song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save}
  end

end