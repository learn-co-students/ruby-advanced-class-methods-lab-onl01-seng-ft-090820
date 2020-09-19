require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.new.tap{|s| s.save}
  end 

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = self.new.tap{|s| s.save}
    song.name = name
    song
  end 

  def self.find_by_name(name)
      self.all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ") 
    artist_name = parts[0]
    song_name = parts[1].chomp(".mp3")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 
  
  def self.create_from_filename(filename)
    answer = self.new_from_filename(filename)
    song = self.create
    song.name = answer.name
    song.artist_name = answer.artist_name
    song
  end 
  
  def self.destroy_all
    self.all.clear
  end 
end
