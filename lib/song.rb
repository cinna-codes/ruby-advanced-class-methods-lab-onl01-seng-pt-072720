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
    if self.find_by_name(song_name) == false
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end


    # if @@all.find { |song| song.name == song_name } == true
    #   return song
    # else
    #   new_song = self.new
    #   new_song.name = song_name
    #   @@all << new_song
    #   return new_song
    # end

    # @@all.each do |song|
    #   if song.name == song_name
    #     return song
    #
    #   else
    #     new_song = self.new
    #     new_song.name = song_name
    #     return new_song
    #   end
    # end

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
