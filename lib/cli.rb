class CLI

  def call
    puts "Welcome to the 2016 episode archive of On Being. Do you want to see a list of episodes? y or n"
    input = gets.strip
    case input
    when "y"
    Philosophy_podcast::Scraper.scrape_episode_list
    puts "Would you like to see more detail on an episode? Type the episode's number."
    #display Podcast class's attributes by index, input = index
    when "n"
      "Goodbye!"
    end
  end

end
