class Philosophy_podcast::Scraper

  def self.scrape
    Nokogiri::HTML(open('http://www.onbeing.org/programs/2016'))
  end

end
