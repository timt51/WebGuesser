require "sinatra"
require "sinatra/reloader"

guesses_available = 5

SECRET_NUMBER = rand(99) + 1

def check_guess(guess)
	if params["guess"].nil?
	else	
		if guess > SECRET_NUMBER
			if guess - 5 > SECRET_NUMBER
				return "Way too high!!!"
			else										
				return "Too high!"
			end
		elsif guess < SECRET_NUMBER
			if guess + 5 < SECRET_NUMBER	
				return "Way too low!!!"
			else										
				return "Too low!"
			end
		else											
			return "You got it right! The secret number is #{SECRET_NUMBER}" 
		end
	end
end

def style(message)
	case message
		when "Way too high!!!" then "background: red"
		when "Way too low!!!" then "background: red"
		when "Too high!" then "background: #FF4D4D"
		when "Too low!" then "background: #FF4D4D"
		when "You got it right! The secret number is #{SECRET_NUMBER}" then "background: green"
		else
	end
end

get "/" do
	if params["guess"] == SECRET_NUMBER
		SECRET_NUMBER = rand(99) + 1
		guesses_available = 5
		message = "You got it right! The secret number is #{SECRET_NUMBER}"
	elsif guesses_available > 1
		guess = params["guess"].to_i
	  message = check_guess(guess)
	  style = style(message)
	  guesses_available = guesses_available - 1
	else
		SECRET_NUMBER = rand(99) + 1
		guesses_available = 5
		message = "You lost! A new number has been generated."
	end
  erb :index, :locals => {:message => message, :style => style, :guesses_available => guesses_available + 1}
end