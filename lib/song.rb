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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    song = self.new_by_name(filename.split(" - ")[1].split(".")[0])
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_by_name(filename.split(" - ")[1].split(".")[0])
    song.artist_name = filename.split(" - ")[0]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
