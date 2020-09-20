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
    song = self.new       #instantiates a song
    song.save             #saves the song
    song
  end
  
  def self.new_by_name(name)
    song = self.new       #instantiates a song
    song.name = name      #name property is applied
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
    
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)    #if find_by_name returns true it stays left, else right
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name}   #remember .name is an attr_accessor
  end
  
  def self.new_from_filename(filename)
    no_fileformat = filename.chomp(".mp3")            #"artist - song name"
    split_filename = no_fileformat.split(" - ")       #["artist", "song"]
    song = self.new                                   #instantiates a new song
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end
  
  def self.create_from_filename(filename)
    no_fileformat = filename.chomp(".mp3")            
    split_filename = no_fileformat.split(" - ")       
    song = self.new                                   
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
