class Genre
  attr_accessor :name, :musicimporter
  attr_reader :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self if song.genre.nil?
    self.songs << song unless songs.include?(song)
    self.artist << song.artist unless songs.include?(song)
  end

  def artists
    self.songs.collect {|s|s.artist}.uniq
  end

end
