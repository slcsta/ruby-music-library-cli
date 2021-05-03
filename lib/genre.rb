require "pry"
class Genre
    extend Concerns::Findable 

    attr_accessor :name

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

    def self.create(genre_name)
        genre = self.new(genre_name)
    end

    def songs
        Song.all.select{|song| song.genre == self}
    end

    def artists
        songs.collect {|song| song.artist}.uniq   
    end


end
