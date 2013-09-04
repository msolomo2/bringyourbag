require 'sinatra'
require 'haml'

get '/' do 
	haml :index  
end  

get '/about' do 
	haml :about
end

get '/issue' do
	haml :issue
end

get '/events' do
	haml :events
end
