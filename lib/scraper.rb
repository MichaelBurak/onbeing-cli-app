class Philosophy_podcast::Scraper

  def self.scrape #main scraper
    Nokogiri::HTML(open('http://www.onbeing.org/programs/2016')).xpath("//span[@class='field-content']/a")
  end

  def self.scrape_episode_list #scrapes text of each podcast episode name
    self.scrape.xpath("//span[@class='field-content']/a").each_with_index do |pod, i|
      puts "#{i}... #{pod.text}"
    end
  end

end
  binding.pry
