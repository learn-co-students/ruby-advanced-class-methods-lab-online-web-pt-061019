class Song
  @@all = []

  attr_accessor :name, :artist_name

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    new_song = self.new
    @@all << new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end


end
end
