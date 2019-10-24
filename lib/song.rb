class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    return song
  end
  
  def self.create_by_name(string)
    song = self.new
    song.name = string
    @@all << song
    return song
  end
  
  def self.find_by_name(string)
    @@all.find{|song| song.name == string}
  end   
  
  def self.find_or_create_by_name(string)
    found = find_by_name(string)
    if found == nil 
      create_by_name(string)
    else 
      return found
    end
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name } #song.name sorts by name of song
    #default sort_by does ascending order
  end
  
  def self.new_by_name(string)
    song = self.new 
    song.name = string
    return song
  end
  
  def self.new_from_filename(string)
    artist_and_song = string.split(" - ")
    artist = artist_and_song[0]
    song_name = artist_and_song[1].delete_suffix(".mp3")
    song = self.new 
    song.name = song_name
    song.artist_name = artist
    return song
  end
  
  def self.create_from_filename(string)
    song = new_from_filename(string) 
    song.save
    return song
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
