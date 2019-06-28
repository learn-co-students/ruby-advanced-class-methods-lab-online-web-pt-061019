require 'pry'

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
    @@all << song
    song
  end
  
  def self.new_by_name(string_name)
    song = self.new
    song.name = string_name
    song
  end 
  
  def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
  end
  
  def self.find_by_name(string_name)
    @@all.find { |song|
      song.name == string_name
    }
  end 
  
  def self.find_or_create_by_name(string_name)
    if self.find_by_name(string_name)
      self.find_by_name(string_name)
    else
    self.create_by_name(string_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end 
  end 
  
  def self.new_from_filename(file_name)
    song_array = file_name.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    # song_array = filename.split(" - ")
    # artist_name = song_array[0]
    # song_name = song_array[1].chomp(".mp3")
    # song = self.new
    # song.name = song_name
    # song.artist_name = artist_name
    # @@all << song
    
    @@all << self.new_from_filename(filename)
  end 
  
  def self.destroy_all
    @@all.clear
  end
end
