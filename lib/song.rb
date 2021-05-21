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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    return song if song
    return create_by_name(name)
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    array = filename.scan(/(.*) - (.*).mp3/)
    if array
      song = Song.new
      song.artist_name = array[0][0]
      song.name = array[0][1]
      song
    else
      nil
    end
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end


end
