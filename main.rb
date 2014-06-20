require 'sinatra'
require 'mandrill'  

def request_res(who, party_size, day, time, contact)

	m = Mandrill::API.new
	
	message = {   
	
	:subject=> "New Reservation Request",   
	:from_name=> who, 
	:text=> [who,party_size,day,time,contact].to_s,  
	:to=>[{:email=> "carlyr@gmail.com",:name=> "Carly"}],
	:html=> "<html>#{[party_size,day,time].to_s}</html>",   
	:from_email=> contact

	} 

	sending = m.messages.send message 
	puts sending
end	


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

get '/reservation' do 
	@title = "reservation"
	erb :reservation, :layout => false
end

post '/new-reservation' do 
	request_res(params[:who], params[:party_size], params[:day], params[:time], params[:contact])
	redirect to('/')
end



