module Concerns::Findable
  
  def self.find_by_name(name)
    self.all.detect { |titles| titles.name == name }
  end
  
  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create(song)
  end
end