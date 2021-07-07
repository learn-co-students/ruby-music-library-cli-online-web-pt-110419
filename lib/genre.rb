class Genre
    extend Concerns::Findable
    attr_accessor :name, :genre

    @@all = []

    def initialize(name)
        @name= name
        @songs = []
    end

    def artists
        collection = songs.collect { |song|
            song.artist
        }
        collection.uniq
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre

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