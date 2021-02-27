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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title) #instantiates a song with a name property
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
    self.all.detect{|a| a.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by{|a| a.name}
  end

  def self.new_from_filename(file_name)
    #binding.pry
    file = file_name.split(" - ")
    # binding.pry
    artist_name = file[0]
    song_title = file[1].gsub(".mp3", "") #gsub(/\d+, "") only removes last, /\w+ for iterating words

    song = self.new
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    file = file_name.split(" - ")
    artist_name = file[0]
    song_title = file[1].gsub(".mp3", "")

    song = self.create
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
   
end
