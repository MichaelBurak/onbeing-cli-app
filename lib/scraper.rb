class Philosophy_podcast::Scraper
attr_accessor :title
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape #main scraper
    Nokogiri::HTML(open('http://www.onbeing.org/programs/2016'))#.xpath("//span[@class='field-content']/a")
  end

  def self.scrape_episode_list #scrapes text of each podcast episode name, "puts" line is/was to test
    #would correspond to @title
    self.scrape.xpath("//span[@class='field-content']/a").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_guests #would correspond to @guest
    self.scrape.xpath("//div[@class='field-content']/a[@class='guests-link']").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_description #would correspond to @description
    self.scrape.xpath("//div[@class='views-field views-field-field-episode-main-header-blurb']/div[@class='field-content']/p").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_dates #would correspond to @date
    self.scrape.xpath("//div[@class='field-content']/span[@class='date-display-single']").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_episodes #doesn't currently work, meant to 1. scrape, 2. instantiate new objects with attributes(currently testing title)
    doc= self.scrape
    ep_doc = doc.search("//div[@class='panel-pane pane-views pane-episode-list episode-list-show-block clearfix']")
    ep_doc.each do |pod|
    self.new.title = doc.xpath("//div[@class='field-content']/span[@class='date-display-single']").text
  end
  end
end
  binding.pry
