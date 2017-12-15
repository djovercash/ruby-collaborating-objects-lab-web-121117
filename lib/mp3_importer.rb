require "pry"

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|mp3| !File.directory? mp3}
  end

  def import
    self.files.each {|filename| Song.new_by_filename(filename)}
  end
end
