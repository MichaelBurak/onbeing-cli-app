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

  def self.scrape_episode_list #scrapes text of each podcast episode name
    self.scrape.xpath("//span[@class='field-content']/a").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_guests
    self.scrape.xpath("//div[@class='field-content']/a[@class='guests-link']").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_descriptions
    self.scrape.xpath("//div[@class='views-field views-field-field-episode-main-header-blurb']/div[@class='field-content']/p").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_dates
    self.scrape.xpath("//div[@class='field-content']/span[@class='date-display-single']").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

  def self.scrape_episodes
    doc= self.scrape
    ep_doc = doc.search("//div[@id='main-wrapper']/div[@id='main']/div[@id='content']/div[@class='section']/div[@class='region region-content']/div[@id='block-system-main']/div[@class='content']/div[@id='master-episode-list-block']/div[@class='panel-col-top panel-panel clearfix']/div[@class='inside']/div[@class='panel-pane pane-views pane-episode-list episode-list-show-block clearfix']")
    ep_doc.each do |pod|
    cast = self.new
    cast.title = doc.xpath("//div[@class='field-content']/span[@class='date-display-single']").text
  end
end

end
  binding.pry

#//div[@class='field-content']/a[@class='guests-link'] - xpath for guest
# //div[@class='views-field views-field-field-episode-main-header-blurb']/div[@class='field-content']/p - xpath for episode description
#master-episode-list-block > div.panel-col-top.panel-panel.clearfix > div > div.panel-pane.pane-views.pane-episode-list.episode-list-show-block.clearfix
