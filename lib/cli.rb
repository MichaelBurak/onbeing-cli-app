class CLI

  def call
    puts "Welcome to the 2016 episode archive of On Being. Do you want to see a list of episodes? y or n"
    input = gets.strip
    case input
    when "y"
    puts "do you want to see 1-10, 2,20, etc."
    #input = gets.strip.to_i
    #Philosophy_podcast::Podcast method for displaying episode list(input), refer to world's best restaurant
    puts "Would you like to see more detail on an episode? Type the episode's number."
    #display Podcast @@all but by index with input = index - 1
    #add in ability to go back to the list, exit
    #add in stuff for non-applicable input
    when "n"
      "Goodbye!"
    end
  end

end
