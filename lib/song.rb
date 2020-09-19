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
    @@all << song
    song
  end
  
  def self.new_by_name(title) 
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title) 
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
     @@all.find{|song| song.name == title}
  end
  
  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
      if result
        return result
    else
      self.create_by_name(title)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(title)
    fix_song = title.split(" - ")
    fix_song[1] = fix_song[1].chomp(".mp3")
    song = self.new
    song.name = fix_song[1]
    song.artist_name = fix_song[0]
    song
  end
  
  def self.create_from_filename(title)
    result = self.new_from_filename(title)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end
  
  def self.destroy_all
    @@all = []
  end
end
