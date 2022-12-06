class Players::GamesController < ApplicationController
  def index
    @player = Player.find(params[:id])
    @games = @player.ordered_games(params[:sort])
  end

  def new
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.find(params[:id])
    @game = @player.games.create(game_params)
    redirect_to "/players/#{@player.id}/games"
  end

  private 

  def game_params
    params.permit(:name, :won, :number_of_moves)
  end
end
