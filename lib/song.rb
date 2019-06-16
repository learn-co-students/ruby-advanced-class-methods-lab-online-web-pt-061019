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
  hello = Song.new_by_name("Hello")
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end

  def self.find_by_name(song_name)
    song_match = nil 
    self.all.each do |song|
      if song_name == song.name
        song_match = song
      end
    end
    song_match
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      #binding.pry
      self.create_by_name(song_name)
    else 
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
    #iterate through my song array
    Song.all.sort_by do |song| 
      song.name 
    end 
  end 

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    filename_name_array = filename_array[1].split(".")
    filename_song = Song.create_by_name(filename_name_array[0])
    filename_song.artist_name = filename_array[0]
    filename_song
  end
  
  def self.create_from_filename(filename)
    filename_array = filename.split(" - ")
    filename_name_array = filename_array[1].split(".")
    filename_song = Song.create_by_name(filename_name_array[0])
    filename_song.artist_name = filename_array[0]
    filename_song
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
end
