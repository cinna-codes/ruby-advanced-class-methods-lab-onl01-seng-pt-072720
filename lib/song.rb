require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    @@all << new_song
    return new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    return new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    return new_song
  end

  def self.find_by_name(song_name)
    @@all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |s| s.name }

  end

  def self.new_from_filename(song_name)
    new_song = self.new
    new_song.name = song_name[0...-4].split(" - ")[1]
    new_song.artist_name = song_name[0...-4].split(" - ")[0]
    new_song
  end
    # data = song_name[0...-4].split(" - ")
    # song_name.name = data[0]
    # song_name.artist_name = data[1]
    # song_name

    #return new_song
    # data = song_name
    # song_name = self.new
    # data = data.split(" - ")
    # data = data.split(".mp3")
    # song_name.name = data[0]
    # song_name.artist_name = data[1]
    # song_name
binding.pry

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
