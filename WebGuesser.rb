require "sinatra"
require "sinatra/reloader"

SECRET_NUMBER = rand(99) + 1

def check_guess(guess)
	if params["guess"].nil?
	else	
		if guess > SECRET_NUMBER
			if guess - 5 > SECRET_NUMBER
				"Way too high!!!"
			else										
				"Too high!"
			end
		elsif guess < SECRET_NUMBER
			if guess + 5 < SECRET_NUMBER	
				"Way too low!!!"
			else										
				"Too low!"
			end
		else											
			"You got it right! The secret number is #{SECRET_NUMBER}" 
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
	guess = params["guess"].to_i
  message = check_guess(guess)
  style = style(message)
  erb :index, :locals => {:message => message, :style => style}
end