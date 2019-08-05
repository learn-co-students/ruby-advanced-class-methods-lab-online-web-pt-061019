class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(title)
    self.all.find{|song| song.name == title}
  end
  
  def self.find_or_create_by_name(title)
    search = self.find_by_name(title)
    if search
      search
    else
      self.create_by_name(title)
    end
  end
  
  def self.alphabetical
    sorted = self.all.sort_by{|song| song.name}
    sorted
  end
  
  def self.new_from_filename(title)
    song = self.new_by_name(title)
    array = song.name.split(' - ')
    song.name = array[1].chomp ".mp3"
    song.artist_name = array[0]
    song
  end
  
  def self.create_from_filename(title)
    song = self.create_by_name(title)
    array = song.name.split(' - ')
    song.name = array[1].chomp ".mp3"
    song.artist_name = array[0]
    song   
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all = []
  end

end
