require_relative 'filenameparser'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    songMetaData = parse(filename)

    artist_name = songMetaData[0]
    song_title = songMetaData[1]
    genre = songMetaData[2]

    songObj = self.new(song_title)
    artistObj = Artist.find_or_create_by_name(artist_name)
    songObj.artist = artistObj
    artistObj.songs << songObj
    songObj
  end
end
