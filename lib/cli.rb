class Philosophy_podcast::CLI

  def call
    puts "Welcome to the 2016 episode archive of On Being. Do you want to see a list of episodes? Enter y or n."
    input = gets.strip
    if input == "n" then
      puts "Goodbye!"
    elsif input == "y"
    Philosophy_podcast::Podcast.add_podcasts
    begin
    puts "Do you want to see episodes 1-10, 5-14, etc.?"
    i = gets.strip.to_i
    print_list(i)
    puts "Would you like to see more detail on an episode? Type the episode's number."
    i2 = gets.strip.to_i
    print_episode(i2)
    puts "Would you like to go back to the list? y or n? n will quit the program."
    i3 = gets.strip
    if i3 == "y" then next
    end until i3 == "n"
    end
    end
  end

  def print_list(from_number)
    puts ""
    puts "Episodes #{from_number} - #{from_number +9}"
    Philosophy_podcast::Podcast.all[from_number-1, 10].each.with_index(from_number) do |podcast, index|
      puts "#{index}. #{podcast.title}"
    end
  end

  def print_episode(from_number)
    puts ""
    puts "#{Philosophy_podcast::Podcast.all[from_number-1].title} - #{Philosophy_podcast::Podcast.all[from_number-1].guest}"
    puts "#{Philosophy_podcast::Podcast.all[from_number-1].description}"
    puts ""
  end


end
