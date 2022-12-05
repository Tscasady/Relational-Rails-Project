class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    game = Game.find(params[:id])
    game.update(name: params[:name], won?: params[:won], pieces: params[:pieces])
    redirect_to "/games/#{game.id}"
  end
end