require "pry"
class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(@path).select {|f| !File.directory? f}
    end

    def import 
        files.map { |song|
        Song.create_from_filename(song)
        }
    end

end