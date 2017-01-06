class Philosophy_podcast::Scraper
attr_accessor :title, :guest
  @@all = []
  @@guest_array = []
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

  def self.scrape_guests #scrapes and pushes to guest array to be indexed into attributes
    self.scrape.xpath("//div[@class='field-content']/a[@class='guests-link']").each_with_index do |pod, i|
      @@guest_array << "#{pod.text}"
    end
  end

  def self.array #displays guest array
    @@guest_array
  end

  def self.add_guests #instantiates new instances and adds guest array to guest attribute
    @@guest_array.each do |ga|
    n = self.new
    n.guest = ga
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


  binding.pry

end
#scrape descriptions, etc. into arrays and then when iterating over scraped data, instantiate by using a counter
#- the index number that corresponds. Ie. scrape_title.text.each_with_index push into a new array, then a = self.new , a.title = [index of new array=counter]?
