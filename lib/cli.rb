class Philosophy_podcast::CLI

  def call
    puts "Welcome to the 2016 episode archive of On Being. Do you want to see a list of episodes? y or n"
    input = gets.strip
    case input
    when "y"
    Philosophy_podcast::Podcast.add_podcasts
    puts "do you want to see 1-10, 2,20, etc."
    i = gets.strip.to_i
    print_list(i)
    puts "Would you like to see more detail on an episode? Type the episode's number."
    i2 = gets.strip.to_i
    print_episode(i2)
    puts "Would you like to go back to the list? y or n"
    #how to loop here?
    #add in stuff for non-applicable input
    when "n"
      "Goodbye!"
    end
  end

  def print_list(from_number)
    puts "Episodes #{from_number} - #{from_number +9}"
    Philosophy_podcast::Podcast.all[from_number-1, 10].each.with_index(from_number) do |podcast, index|
      puts "#{index}. #{podcast.title}"
    end
  end

  def print_episode(from_number)
    puts "#{Philosophy_podcast::Podcast.all[from_number].title} - #{Philosophy_podcast::Podcast.all[from_number].guest}"
    puts "#{Philosophy_podcast::Podcast.all[from_number].description}"
  end


end
