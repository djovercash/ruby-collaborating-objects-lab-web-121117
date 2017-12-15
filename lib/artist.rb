class Artist
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def songs
    @songs
  end

  def save
    self.class.all << self
    self
  end

  def self.find_by_name(artist_name)
    self.all.detect {|artist| artist.name == artist_name }
  end

  def self.find_or_create_by_name(name)
    find_artist = @@all.find { |artist| artist.name == name}
    if find_artist
      find_artist
    else
      artist = Artist.new(name)
      artist.save
    end
  end


  def print_songs
    artists_songs = []
    @songs.each do |song|
      artists_songs << song.name
    end
    puts artists_songs.join("\n")
  end
end
