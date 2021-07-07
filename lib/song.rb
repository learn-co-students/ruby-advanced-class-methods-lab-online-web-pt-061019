class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create           #class constructor 
    song = self.new         #vairable equal to the newly made Song class
    @@all << song           #push the song into the @@all array
    song                    #returns the song
  end

  def self.new_by_name(name)
    song = self.new         #variable equal to the newly made Song class
    song.name = name        #makes the name of the song equal to a name variable 
    song                    #return the song with the name of its own property
  end

  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song 
    song 
  end
  
  def self.find_by_name(name)
    @@all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) #either find the song OR create the song by name
  end
  
  def self.alphabetical
    @@all.sort_by {|a| a.name} 
  end

  def self.new_from_filename(name)
    song = self.new             #create a new file song
    song.name = (name.split(" - ")[1].chomp(".mp3"))    #the name of the song is split at the - on the second (index 1) string 
    song.artist_name = (name.split(" - ")[0]) #the artist name is split at the - on the first (index 0) string
    song #.chomp just returns a new string from the array
  end

  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song #adds the above to the all songs list
    song 
  end 
  
  def self.destroy_all()
    @@all.clear
  end


end
