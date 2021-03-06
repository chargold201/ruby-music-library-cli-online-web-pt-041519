class Genre
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

    def artists
        self.songs.collect(&:artist).uniq
    end
end