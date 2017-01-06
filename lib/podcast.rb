class Philosophy_podcast::Podcast
  attr_accessor :guest, :description, :date, :title

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end 
