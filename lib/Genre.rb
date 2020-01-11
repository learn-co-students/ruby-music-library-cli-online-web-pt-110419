 class Genre
   extend Concerns::Findable
    attr_accessor :name, :genre, :artist
    
    @@all = []
    
    def initialize(name)
      @name = name
      @songs = []
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
    
    def self.create(genre)
      new_genre = Genre.new(genre)
    end
    
    def songs
      @songs
    end 
    
    def artists
      self.songs.collect{|song|song.artist}.uniq
    end
  
  end