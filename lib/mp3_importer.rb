require 'pry'
class MP3Importer
  attr_reader :path, :files
  def initialize(path)
    @path = path
    @files = Dir[path + "/*.mp3"].map! {|pathfile| pathfile.gsub(path + '/', '')}
  end

  def import
    @files.each do |filenamestring|
      Song.new_by_filename(filenamestring)
      # parsedFilenameArray = parse(filenamestring)
      # artist_name = parsedFilenameArray[0]
      # songtitle = parsedFilenameArray[1]
      # genre = parsedFilenameArray[2]
      # # There has to be a better to do the following logic.
      # unless Artist.find_by_name(artist_name)
      #   artistObj = Artist.create_by_name(artist_name)
      #   artistObj.save
      # end
      # artistObj ||= Artist.find_by_name(artist_name)
      # song = artistObj.add_song(songtitle)
    end
end
end
