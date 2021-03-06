require 'pry'
require_relative './concerns/findable.rb' # why do I need this to get tests to pass?

class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        self.class.all << self
    end

    def self.create(name)
        self.new(name).tap(&:save)
    end

    def add_song(song)
        song.artist = self unless song.artist
        self.songs << song unless self.songs.include? song
    end

    def genres
        self.songs.collect(&:genre).uniq
    end
end