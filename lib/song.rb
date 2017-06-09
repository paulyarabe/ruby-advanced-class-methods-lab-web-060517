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
  	@new_song = Song.new
  	@@all << @new_song
  	@new_song
  end

  def self.new_by_name(song_name)
  	self.create.name = song_name
  	@new_song
  end

  def self.create_by_name(song_name)
  	self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
  	@@all.select {|song| song_name == song.name }[0]
  end

  def self.find_or_create_by_name(song_name)
  	result = find_by_name(song_name)
  	if result
  		return result
  	else
  		return create_by_name(song_name)
  	end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    @artist_name = arr[0]
    @name = arr[1].split(".")[0]
    new_song = self.new_by_name(@name)
    new_song.artist_name = @artist_name
    new_song
  end

  def self.create_from_filename(filename)
    newly_created_song = self.new_from_filename(filename)
    @@all << newly_created_song
  end

  def self.destroy_all
    self.all.clear
  end

end

# Pry.start
