require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    @song = self.new

    @@all << @song
    @song
  end

  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end

  def self.create_by_name(name)
    @song = self.new
    @song.name = name
    @@all << @song
    @song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    end
    @song
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    @song = self.new
    @song.artist_name = file_name.split(" - ").first
    @song.name = file_name.split(" - ")[1].gsub(/[.][a-zA-Z\d]{3}/, "")
    @song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
    @@all << @song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
