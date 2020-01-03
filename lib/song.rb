class Song

attr_accessor :name
attr_reader :artist

@@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
    # if artist exist then make self.artist
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

end
