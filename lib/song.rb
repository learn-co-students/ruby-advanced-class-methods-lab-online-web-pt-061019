class Song

  attr_accessor :name, :artist_name

  @@all = []

def self.all
    @@all
end

def save
    self.class.all << self
end

def self.create  #creates an instance only, no name.
    song = self.new
    song.save
    song
end

def self.new_by_name(name)#  created a new song then given a name song.name "Blank Space"
    song = self.new
    song.name = name
    song
end

def self.create_by_name(name) #instanciates then provides a name
    song = self.new
    song.name =name
    @@all << song
    song
end

def self.find_by_name(name)
    @@all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song then
        return song
    else
        self.create_by_name(name)
    end
  end

def self.alphabetical
  sorted = @@all.sort_by{|song| song.name}
  sorted
end

def self.new_from_filename(name)
  song = self.new
  #song.save
  song.name = (name.split(" - ")[1].chomp(".mp3"))
  song.artist_name = (name.split(" - ")[0])
  song
end

def self.create_from_filename(name)
  song = self.new
  song.save
  song.name = (name.split(" - ")[1].chomp(".mp3"))
  song.artist_name = (name.split(" - ")[0])
  song
end


def self.destroy_all
  @@all.clear
end

end
