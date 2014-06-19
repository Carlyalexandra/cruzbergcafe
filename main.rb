require 'sinatra'
require 'mandrill'  

get '/' do
	@title = "Welcome"
  erb :index
end

get '/index' do
  erb :index
end
get '/breakfast' do 
	@title = "Breakfast Menu"
	erb :breakfast
end

get '/lunch' do 
	@title = "Lunch Menu"
	erb :lunch
end

get '/dinner' do 
	@title = "Dinner Menu"
	erb :dinner
end

get '/takeout' do 
	@title = "Take Out"
	erb :takeout
end
get '/gallery' do 
	@title = "Gallery"
	erb :gallery
end