class Genre
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
    genre = new(name)
    genre.save
    genre
  end
  
  def songs
    @songs
  end
  
  def add_song (song)
    @songs << song
  end
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end

  

end
