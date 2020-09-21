class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  ##self
    #@@all << self #instantiates and saves the song, and it returns the new song that was created
  #end
  
  
  def self.create #instantiates and saves the song, and it returns the new song that was created
    self.new.tap {|name| name.save} #tap method allows you to do something with an object inside of a block and always have that block return the object itself
  end
  
  
  def self.new_by_name(name) #instantiates a song with a name property
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name) #this combines the two defined class methods above
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.detect {|x| x.name == name} #finding a song in @@all by name, .detect will return false implicitly when a song name is not present (so no need to do a boolean, if/else)
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical()
    @@all.sort_by {|x| x.name}
  end
  
  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    result = self.new_from_filename(filename) #we already built a class constructor that accepts a filename in the format above, so "result ="" will reference that
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  

end

