class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    sets = Cardset.all.order(:timestamp)
    sets.to_json
  end
  get "/games" do
    games = Game.all
    games.to_json 
  end

  get "/games/423423/:id" do
    cards = Cardset.find(params[:id])
    cards.cards.to_json
  end
  get "/games/4234234/:id" do 
    game = Game.create(user_id: 1, cardset_id: params[:id], difficulty: "easy", date: Time.now, score: 0)
    game.to_json
  end
  # post "/games/4234234/:id" do
  #   game = Game.create(user_id: 1, cardset_id: params[:id], difficulty: "easy", date: Time.now, score: 0)
  #   game.to_json
  # #patch at end of game change scorepry
  # end
  get "/games/:id" do
    game = Game.find_by(user_id: params[:user_id], cardset_id: params[:cardset_id])
    game.to_json
  end
  patch "/games/4234234/:id" do
    game = Game.update(difficulty: params[:difficulty])
    game.to_json
  end

end
