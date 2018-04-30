require 'pry'
class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    @@all.detect { |obj| obj.name == name }
  end

  def self.create_by_name(name)
    new_artist = Artist.new(name)
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name).nil? ? self.create_by_name(name) : self.find_by_name(name)
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end
end
