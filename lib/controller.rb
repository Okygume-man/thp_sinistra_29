require 'gossip'

class ApplicationController < Sinatra::Base
 

  get '/' do
  	erb :index, locals: {gossips: Gossip.all, id: Gossip.find(params[:id])}
 
  end

  get '/gossips/new' do
	erb :new_gossip	
  
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
 
  end
  
  get '/gossips/:id' do 
    puts Gossip.find(params[:id])
	puts "Le gossip recherché est le numéro #{params[:id]}"
	erb :gossip_page, locals: {gossips: Gossip.all, id: Gossip.find(params[:id])}
  
  end
end
