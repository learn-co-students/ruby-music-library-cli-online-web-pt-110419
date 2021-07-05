class Artist
  
  extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
    def self.create(name)
    artist = new(name)
    artist.save
    artist
  end
  
    def self.all
    @@all
  end
  
  def name
    @name
  end
  
  def save
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  
  
  def song
    Song.all.select { |title| title.artist == self }
  end 
  
  def genres 
    songs.map { |title| title.genre }.uniq
    end
  
end
  
