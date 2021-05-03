require "pry"
class Artist 
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        save
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

    def self.create(artist_name)
        artist = self.new(artist_name)
    end

    def add_song(song)
        song.artist = self unless song.artist
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end
    
    def add_song(song)
        song.artist = self unless song.artist
    end

    def genres
        g = songs.map do |song| 
            song.genre
        end
        g.uniq
    end
end   