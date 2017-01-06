class Philosophy_podcast::Scraper

  @@guest_array = []
  @@title_array = []
  @@description_array = []

  def self.scrape #main scraper
    Nokogiri::HTML(open('http://www.onbeing.org/programs/2016'))#.xpath("//span[@class='field-content']/a")
  end

  def self.scrape_episode_title #scrapes text of each podcast episode name, "puts" line is/was to test
    #would correspond to @title
    self.scrape.xpath("//span[@class='field-content']/a").each_with_index do |pod, i|
      @@title_array << "#{pod.text}"
    end
  end

  def self.scrape_guests #scrapes and pushes to guest array to be indexed into attributes, corresponds to @guest
    self.scrape.xpath("//div[@class='field-content']/a[@class='guests-link']").each_with_index do |pod, i|
      @@guest_array << "#{pod.text}"
    end
  end

  def self.scrape_description #would correspond to @description
    self.scrape.xpath("//div[@class='views-field views-field-field-episode-main-header-blurb']/div[@class='field-content']/p").each do |pod|
      @@description_array << "#{pod.text}"
    end
  end

  def self.add_podcasts #instantiates new instances and adds arrays to attributes
    self.scrape_guests
    self.scrape_episode_title
    self.scrape_description
    counter = 0
    while counter < 100
    n = Philosophy_podcast::Podcast.new
    n.guest = @@guest_array[counter + 1]
    n.title = @@title_array[counter]
    n.description = @@description_array[counter + 1]
    counter += 1
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
