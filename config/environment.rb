require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

Class: Artist
 attr_accessor :name, :genre
 
  def initialize(name, genre) 
    @name = name
    @genre = genre
  end
 
end

Class: songs
 attr_accessor :title, :artist
 
  def initialize(title)
    @title = title
  end
 
end


Class: Genre
attr_accessor :name, :song, :artist
drake = Artist.new("Lizzo", "rap")
Good_as_hell = Song.new("Good_as_hell")
 
Good_as_hell.artist = Lizzo
