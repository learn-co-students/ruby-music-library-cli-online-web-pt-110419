class Artist

    extend Concerns::Findable

    attr_accessor :name, :genre

    @@all = []

    def initialize(name)
        @name= name
        @songs = []
    end
    
    def genres
        collection = songs.map {|song| 
            song.genre
        } 
        collection.uniq
    end

    def self.create(artist_name)
        artist = Artist.new(artist_name)
        artist.save
        artist
    end

    def add_song(song)
        if song.artist != self
            song.artist = self
        end
        
        if songs.include?(song) == false
            self.songs << song
        end
    end

    def songs
        @songs
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

end