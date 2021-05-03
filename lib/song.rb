
require 'pry'
class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=artist if artist
        binding.pry
        self.genre=genre if genre
        #save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(song_name)
        song = self.new(song_name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        same_song = self.find_by_name(name) || other_song = self.create(name)
    end

    def self.new_from_filename
        #instantiates a new Song object
        #based on the provided filename
    end

    def self.create_from_filename
        #does same thing as .new_from_filename
        #but also saves the newly created song in @@all class variable
    end
end



