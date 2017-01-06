class Philosophy_podcast::Scraper

  def self.scrape #main scraper
    Nokogiri::HTML(open('http://www.onbeing.org/programs/2016'))#.xpath("//span[@class='field-content']/a")
  end
  
end
