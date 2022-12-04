class Players::GamesController < ApplicationController
  def index
    @player = Player.find(params[:id])
    @games = @player.games
  end

  def new
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.find(params[:id])
    @game = @player.games.create(name: params[:name], won?: params[:won], pieces: params[:pieces])
    redirect_to "/players/#{@player.id}/games"
  end

  private 

  def game_params
    params.permit(:name, :won?, :pieces)
  end
end
