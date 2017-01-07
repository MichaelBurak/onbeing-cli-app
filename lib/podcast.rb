class Philosophy_podcast::Podcast
  attr_accessor :guest, :description, :title

  @@all = []
  @@guest_array = []
  @@title_array = []
  @@description_array = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_episode_title
    Philosophy_podcast::Scraper.scrape.xpath("//span[@class='field-content']/a").each_with_index do |pod, i|
      @@title_array << "#{pod.text}"
    end
  end

  def self.scrape_guests
    Philosophy_podcast::Scraper.scrape.xpath("//div[@class='field-content']/a[@class='guests-link']").each_with_index do |pod, i|
      @@guest_array << "#{pod.text}"
    end
  end

  def self.scrape_description
    Philosophy_podcast::Scraper.scrape.xpath("//div[@class='views-field views-field-field-episode-main-header-blurb']/div[@class='field-content']/p").each do |pod|
      @@description_array << "#{pod.text}"
    end
  end

  def self.add_podcasts
    self.scrape_guests
    self.scrape_episode_title
    self.scrape_description
    counter = 0
    while counter < @@title_array.size
    n = self.new
    n.guest = @@guest_array[counter + 1]
    n.title = @@title_array[counter]
    n.description = @@description_array[counter + 1]
    counter += 1
  end
end

end
