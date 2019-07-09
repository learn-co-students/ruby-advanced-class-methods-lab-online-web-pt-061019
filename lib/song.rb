class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    is_found = self.find_by_name(name)
    
    is_found ? is_found : self.create_by_name(name) 
    
    # if is_found == nil
    #   self.create_by_name(name) 
    # else
    #   is_found
    # end
  end
  
  def self.alphabetical
    self.all.sort! {|a,b| a.name <=> b.name}
  end
  
  def self.new_from_filename(filename)
    info = filename.split(/\s-\s|\./)
    
    artist_name = info[0]
    name = info[1]
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    info = filename.split(/\s-\s|\./)
    
    artist_name = info[0]
    name = info[1]
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  

end