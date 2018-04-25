# PHASE 2
def convert_to_int(str)
  begin 
    Integer(str)  
  rescue ArgumentError => err 
    puts err   
    return nil   
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    elsif maybe_fruit == "coffee" 
      raise CoffeeError
    else 
      raise NoFruitsError
    end 
end

def feed_me_a_fruit
  begin 
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => err 
    puts err.message 
    retry 
  rescue NoFruitsError => err 
    puts err.message 
  end 
end  

# PHASE 4
class BestFriend
  def initialize(*args)
    if args[0..1].any? { |el| el.length == 0 }
      raise "Please enter your name, how long I've known you, and your favorite pasttime."
    end
    @name = args[0]
    @yrs_known = args[2]
    @fav_pastime = args[1]
  end

  def talk_about_friendship
    check_how_long_ive_known_you
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end
  
  def check_how_long_ive_known_you
    if @yrs_known < 5
      raise "Sorry, I know you that well, #{@name}."
    end
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class NoFruitsError < StandardError 
  def message
    "NO FRUITS!!"
  end 
end

class CoffeeError < NoFruitsError
  def message 
    "Coffee is alright but ... "
  end
end


