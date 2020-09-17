require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  # def initialize(name, artist_name)
  #   @name = name
  #   @artist_name = artist_name
  # end
  
  def save
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
  end
  
  def self.create_by_name(name)
    song = self.create
    @name = name
    song.name = @name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name)  || self.create_by_name(name)
  end 
  
  def self.alphabetical
     self.all.uniq.sort_by! {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    
    song = self.new
    file_arr = filename.split(" - ")
    # binding.pry
    file_arr[1].slice!(".mp3")
    song.artist_name = file_arr[0] 
    # song.artist_name = artist_name
    song.name = file_arr[1] 
    # song.name = name
    song 
  end
  
  def self.create_from_filename(filename)
    song = self.new
    file_arr = filename.split(" - ")
    # binding.pry
    file_arr[1].slice!(".mp3")
    artist_name = file_arr[0]
    # @artist_name = artist_name
    song.artist_name = artist_name
    name = file_arr[1] 
    song.name = name
    # @name = name
    @@all << song 
  end
  
  def self.destroy_all
    @@all = [ ]
  end
end
