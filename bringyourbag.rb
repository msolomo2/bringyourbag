require 'sinatra'

get '/' do 
	haml :index  
end  

get '/alderman' do
	haml :alderman
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

get '/call_alderman/:zipcode' do
	Alderman.call_alderman(params[:zipcode])
end

class Alderman do

	def self.call_alderman(zipcode) do
		alderman = find_alderman(zipcode)
		TwilioApi.make_call(alderman.number)
	end

	def find_alderman(zipcode) do
		alderman = Aldermen.find_by(:zipcode, zipcode)
		TwilioApi.choose_alderman(alderman) if alderman.count > 1
	end

end
