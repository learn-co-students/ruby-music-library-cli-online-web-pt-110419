require "pry"
class MusicImporter
  @path = ""
  @files =[]
  
  def initialize(file_path)
    @path = file_path
  end
  
  def path
    @path
  end
  def files
    Dir["#{@path}/*.mp3"].collect {|file_name| file_name.split("#{path}/")[1]}
  end
  
  def import
      files.each{ |f| Song.create_from_filename(f) }
  end
  
end