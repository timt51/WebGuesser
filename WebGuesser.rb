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
get "/" do
	guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end