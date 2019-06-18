require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    # self in the save method is our new instance
   # self.class is Song
   # self.class.all == Song.all
    self.class.all << self
  end

  def self.create
     song = self.new
     @@all << song
     song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
      #  binding.pry
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    song_obj = []
    @@all.each do |obj_arr|
      if obj_arr.name == name
        song_obj << obj_arr
      end
    end
    song_obj.first
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  # song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
  # song.name #=> "Blank Space"
  # song.artist_name #=> "Taylor Swift"
  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    data = filename.split(" - ")
    name = data[1]
    artist_name = data[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    filename.slice! ".mp3"
    data = filename.split(" - ")
    name = data[1]
    artist_name = data[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
    # binding.pry
  end

  def self.destroy_all
    self.all.clear
  end
end
