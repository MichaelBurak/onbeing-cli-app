class Philosophy_podcast::Scraper

  def self.scrape #main scraper
    Nokogiri::HTML(open('http://www.onbeing.org/programs/2016')).xpath("//span[@class='field-content']/a")
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

end
  binding.pry

#//div[@class='field-content']/a[@class='guests-link'] - xpath for guest
# //div[@class='views-field views-field-field-episode-main-header-blurb']/div[@class='field-content']/p - xpath for episode description
