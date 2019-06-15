require "pry"

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
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end 
  
  middle = Song.new_by_name("The Middle")
  secrets = Song.new_by_name("Secrets")
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end

  def self.find_by_name(song_name)
    song_match = Song.new 
    self.all.each do |song|
      if song_name == song.name
        song_match = song
        #binding.pry
      #else 
        #song_match = false 
      end
    end
    song_match
  end

end
