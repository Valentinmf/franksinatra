class ApplicationController < Sinatra::Base

  require 'gossip'

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossip/:name' do
    erb :index_gossip, locals: {gossip: Gossip.find(params[:name].to_i)}
  end


  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

get '/gossips/:id' do
		erb :gossip, locals: {gossip: Gossip.all[params[:id].to_i], id: params[:id].to_i, comments:Comment.all_with_id(params[:id].to_i)}
	end


end