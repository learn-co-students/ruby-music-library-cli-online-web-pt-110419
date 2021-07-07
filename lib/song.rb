require "pry"
class Song

    attr_accessor :name
    

    @@all = []

    def initialize(name, artist= nil, genre= nil)
        @name= name
        if genre != nil
            self.genre= (genre)
        end
        if artist != nil
            self.artist= (artist)
        end
    end

    def artist
        @artist
    end

    def genre
        @genre
    end

    def genre= (genre)
        @genre= genre
        if genre.songs.include?(self) == false
            genre.songs << self
        end
    end


    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def artist= (name)
        @artist = name
        name.add_song(self)
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

    def self.find_by_name(name)
        all.find { |song|
        song.name == name
        }
    end

    def self.find_or_create_by_name(name)
       if self.find_by_name(name) != nil
        self.find_by_name(name)
       else
        self.create(name)
       end
    end

    def self.new_from_filename(file)
        song_info = file.split(" - ")
        song = self.find_or_create_by_name(song_info[1])
        artist = Artist.find_or_create_by_name(song_info[0])
        genre = Genre.find_or_create_by_name(song_info[2].split(".")[0])
        song.artist = artist
        song.genre = genre
        song
    end

    def self.create_from_filename(file)
        song = new_from_filename(file)
        song.save
    end
end