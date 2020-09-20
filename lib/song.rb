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
    return new_song

  end

  def self.new_by_name(name)

    new_song = self.new
    new_song.name = name
    new_song.save
    return new_song

  end

  def self.create_by_name(name)

    new_song = self.create
    new_song.name = name
    #binding.pry
    return new_song

  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

    if !self.find_by_name(name)
      self.create_by_name(name) 
    else
      return self.find_by_name(name)
    end

  end

  def self.alphabetical

    #returns all the songs in ascending (a-z) alphabetical order.

    self.all.sort_by{|song|song.name}

  end

  def self.new_from_filename(filename)

    new_song = self.new
    new_song.artist_name = filename.split(" - ")[0]
    new_song.name = filename.split(" - ")[1].delete_suffix(".mp3") # MINUS THE .mp3
    new_song.save
    return new_song

    #Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return a new Song instance with the song name set to Blank Space and the artist_name set to Taylor Swift.

  end

  def self.create_from_filename(filename)

    #Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3". The Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created.

    new_song = self.new
    new_song.artist_name = filename.split(" - ")[0]
    new_song.name = filename.split(" - ")[1].delete_suffix(".mp3") # MINUS THE .mp3
    new_song.save
    return new_song

  end
  
  def self.destroy_all
    self.all.clear
  end

end

