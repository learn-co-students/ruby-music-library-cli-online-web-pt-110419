class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
    self.save
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

  def self.create(name)
    Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    if artist != nil
      @artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if @genre != nil && @genre.songs.include?(self) == false
      @genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.each{|song|
      if song.name == name
        return song
      end}
    nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      return self.create(name)
    end
  end

  def self.new_from_filename(file)
    fileArray = file.split(' - ')
    newSong = self.find_or_create_by_name(fileArray[1])
    newSong.artist = Artist.find_or_create_by_name(fileArray.first)
    newSong.genre = Genre.find_or_create_by_name(fileArray.last.split('.').first)
    newSong
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end
end
