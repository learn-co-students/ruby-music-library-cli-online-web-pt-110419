module Init 
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def name
    @name
  end
  
  def save
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end