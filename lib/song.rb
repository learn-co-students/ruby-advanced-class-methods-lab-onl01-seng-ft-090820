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
end
