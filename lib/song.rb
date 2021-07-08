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
    new_song = self.new
    @@all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    self.all.find{|new_song| new_song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)  # || operator to find or create
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].chomp(".mp3") # formats song name correctly
    song.artist_name = filename.split(" - ")[0] # formats artist name correctly
    song  # returns the song instance
  end
  
  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].chomp(".mp3") # formats song name correctly
    song.artist_name = filename.split(" - ")[0] # formats artist name correctly
    @@all << song # saves new song instance
  end
  
  def self.destroy_all
    @@all.clear
  end
end