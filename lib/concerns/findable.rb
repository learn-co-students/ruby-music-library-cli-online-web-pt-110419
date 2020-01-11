module Concerns::Findable
  def find_by_name(name)
    all.find{|artist| artist.name == name}
  end
  
  def find_or_create_by_name(song_name)
      find_by_name(song_name) || create(song_name)
  end

end