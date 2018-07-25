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
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end
  
  def self.find_by_name(name)
    found = @@all.find do |s|
      s.name == name
    end
    return found
  end
  
  def self.find_or_create_by_name(name)
    create_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    sorted = @@all.sort_by { |s| s.name }
    return sorted
  end
  
  def self.new_from_filename(filename)
    file = filename.split("-")
    artist_name = file[0]
    song_name = file[1]
  end
  
  
  
  def self.new_from_filename(filename)
    sections = filename.split(" - ")
    artist_name_section = sections[0]
    song_name_section = sections[1].gsub(".mp3","")
    song = self.create
    song.name = song_name_section
    song.artist_name = artist_name_section
    return song
  end

end
