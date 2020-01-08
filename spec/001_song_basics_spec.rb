class Song
 
  attr_accessor :title
 
  def initialize(title)
    @title = title
  end
end

def "Song" do
(:song){ Song.new("In the Aeroplane Over the Sea") }

def Song.new
      new_song = Song.new("Alison")
      new_song_name = new_song.name(:@Alison)
      new_song_name = "Alison"
    end
  end

def song_name("In the Aeroplane Over the Sea")
    @name = name
    song_name = name
    song_name = song.name
    song.name = @@name
    song.name
  end
end

  describe "#name=" do
    it "can set the name of a song" do
      song.name = "Jump Around"

      song_name = song.instance_variable_get(:@name)

      expect(song_name).to eq("Jump Around")
    end
  end

  describe "@@all" do
    it "is initialized as an empty array" do
      all = Song.class_variable_get(:@@all)

      expect(all).to match_array([])
    end
  end

  describe ".all" do
    it "returns the class variable @@all" do
      expect(Song.all).to match_array([])

      Song.class_variable_set(:@@all, [song])

      expect(Song.all).to match_array([song])
    end
  end

  describe ".destroy_all" do
    it "resets the @@all class variable to an empty array" do
      Song.class_variable_set(:@@all, [song])

      Song.destroy_all

      expect(Song.all).to match_array([])
    end
  end

  describe "#save" do
    it "adds the Song instance to the @@all class variable" do
      song.save

      expect(Song.all).to include(song)
    end
  end

  describe ".create" do
    it "initializes, saves, and returns the song" do
      created_song = Song.create("Kaohsiung Christmas")

      expect(Song.all).to include(created_song)
    end
  end
end
