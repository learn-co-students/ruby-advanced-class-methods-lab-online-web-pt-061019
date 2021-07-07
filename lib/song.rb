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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort { |s1, s2| s1.name <=> s2.name}
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    song_name = file[1].chomp(".mp3").strip
    song = self.new_by_name(song_name)
    song.artist_name = file[0].strip
    song.save
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    song_name = file[1].chomp(".mp3").strip
    song = self.new_by_name(song_name)
    song.artist_name = file[0].strip
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
