
class Artist
@@all = []

extend  Concerns::Findable

  def initialize (name)
    @name = name

    @songs = []

  end


  def name
    @name
  end

  def name= (name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  
  def name= (name)
    @name = name
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  


  def self.create (name)
    artist = new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      song.artist
    end
    if @songs.include?(song) 
    else
      @songs << song
    end
  end
  
  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
