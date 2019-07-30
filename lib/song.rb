class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
      song = Song.new #new instance of class Song is capitalized.
      @@all << song
      return song
  end

  def self.new_by_name(song_name) #wont add to array
      song = Song.new
      song.name = song_name
      return song
  end

  def self.create_by_name(song_name) #will add ot array
      song = Song.create
      song.name = song_name
      return song
  end

  def self.find_by_name(song_name)
      @@all.each do |song|
          if song.name == song_name
              return song
          end
      end
      return nil
  end

  def self.find_or_create_by_name(song_name)
      song = Song.find_by_name(song_name)
      if song == nil
          song = Song.create_by_name(song_name)
      end
      return song
  end

  def self.alphabetical
      @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
      names = file_name.split("-")
      song = Song.create_by_name(names[1][0..-5].strip)
      song.artist_name = names[0].strip
      return song
  end

  def self.create_from_filename(file_name)
      names = file_name.split("-")
      song = Song.create_by_name(names[1][0..-5].strip)
      song.artist_name = names[0].strip
      return song
  end

  def self.destroy_all
      @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
