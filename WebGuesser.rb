require "sinatra"
require "sinatra/reloader"

secret_number = rand(99) + 1
# def number
# 	@@secret_number ||= rand(99) + 1
# end

# def check_guess(guess)

# end
get "/" do
	# message = check_guess(guess)
	erb :index, :locals => {:secret_number => secret_number}
end