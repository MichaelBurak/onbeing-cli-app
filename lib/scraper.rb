class Philosophy_podcast::Scraper

  def self.scrape_episode_list
    doc = Nokogiri::HTML(open('http://www.onbeing.org/programs/2016'))
    doc
  end

end
  binding.pry
