class Philosophy_podcast::CLI

  def call
    puts "Welcome to the 2016 episode archive of On Being. Do you want to see a list of episodes? y or n"
    input = gets.strip
    if input == "n" then
      puts "Goodbye!"
    elsif input == "y"
    Philosophy_podcast::Podcast.add_podcasts
    while input || i3 != "n"
      begin
    puts "do you want to see 1-10, 2,20, etc."
    i = gets.strip.to_i
    print_list(i)
    puts "Would you like to see more detail on an episode? Type the episode's number."
    i2 = gets.strip.to_i
    print_episode(i2)
    puts "Would you like to go back to the list? y or n"
    i3 = gets.strip
    if i3 == "y" then next
    elsif i3 == "n" then
      puts "Goodbye"
    end while i3 || input == "n"
    end #how to loop here using i2's input to go back to the correct list?
    #add in stuff for non-applicable input
  end
    end
  end

  def print_list(from_number)
    puts "Episodes #{from_number} - #{from_number +9}"
    Philosophy_podcast::Podcast.all[from_number-1, 10].each.with_index(from_number) do |podcast, index|
      puts "#{index}. #{podcast.title}"
    end
  end

  def print_episode(from_number)
    puts "#{Philosophy_podcast::Podcast.all[from_number-1].title} - #{Philosophy_podcast::Podcast.all[from_number-1].guest}"
    puts "#{Philosophy_podcast::Podcast.all[from_number-1].description}"
  end


end
