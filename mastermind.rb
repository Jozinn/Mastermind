rounds = 12
number_of_slots = 5
slots = []
colors = ['r', 'g', 'b', 'o', 'y', 'w', 'p', 'c']

def fill_slots(n)
    n.times do
        color = colors[rand(colors.length)]
        slots.push(color)
    end
end

def check(guess)
    guesses = guess.split
    feedback = []
    guesses.each_with_index do |guess, i|
        if (guess == slots[i])
            feedback.push('X')
        elsif (slots.include?(guess))
            feedback.push('$')
        else
            feedback.push('o')
        end
    end

    return feedback
end

def greeting()
    puts 'Welcome to Mastermind logic game'
    puts 'You have 12 attempts to guess the code'
    puts 'The code is 5 colors sequence'
    puts 'To try guess enter colors space separated'
    puts 'The colors: r-red g-green b-blue o-orange y-yellow w-white p-purple c-cyan'
    puts 'The feedback format is X-right color at the right position $-color exists in the sequence but at different position o-color does not exist'
    puts 'Good luck'
end

def game()
    greeting()
    fill_slots(number_of_slots)
    rounds.times do
      puts 'Your guess: '  
      guess = gets.chomp
      result = check(guess)
      result = result.select {|r| r == 'X'}
      if (result.length == slots.length)
        puts 'Congratulations you won!'
        sleep 10
        game()
      end
    end
    puts 'You loose :/'
    sleep 10
    game()
end
