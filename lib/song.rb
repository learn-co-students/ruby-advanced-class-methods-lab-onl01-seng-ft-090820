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
  song = self.new 
  song.save
  return song
end

def self.new_by_name(name)
  @name = name
  song = self.new 
  song.name = name 
  return song
end

def self.create_by_name(name)
  song = self.new_by_name(name)
  song.save 
  return song
end

def self.find_by_name(name)
 self.all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
@@all.sort_by { |a| a.name }
end

def self.new_from_filename(filename)
song = self.new
file_array = filename.split(/[-.]/)
file_array.reject {|item| item == "mp3"}
artist_name = file_array[0] 
artist_name = artist_name.delete_suffix(" ")
song.artist_name = artist_name
name = file_array[1] 
name[0] = ""
song.name = name
song 
end

def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save
end

def self.destroy_all
  self.all.clear
end
end