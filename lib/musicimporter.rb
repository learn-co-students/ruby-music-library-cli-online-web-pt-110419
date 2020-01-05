class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.entries(@path).each{|file|
      if file.split('.').last == 'mp3'
        files << file
      end}
    files
  end

  def import
    files.each{|file|
      Song.create_from_filename(file)}
  end
end
