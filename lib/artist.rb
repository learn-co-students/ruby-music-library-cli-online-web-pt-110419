class Artist

attr_accessor :name
attr_reader :songs

@@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    # if song.artist exists then dont do add_song else do add_song
  end
    @songs.push(song) unless @songs.include?(song)
  end
end
