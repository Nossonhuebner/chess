# PHASE 2
def convert_to_int(str)
  begin
  Integer(str)
  rescue ArgumentError
    nil
  end
end

class CoffeeError < StandardError; end
# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError.new("Thanks for the coffee but it's not fruit")
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue StandardError
  end
end

class YearsKnownError < StandardError; end
class NoNameError < StandardError; end
class PasstimeError < StandardError; end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise NoNameError.new("You need a name.") if name.length < 1
    @name = name
    raise YearsKnownError.new("You bareley know each other!") if yrs_known < 5
    @yrs_known = yrs_known
    raise PasstimeError.new("You need a passtime!") if fav_pastime.length < 1
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
