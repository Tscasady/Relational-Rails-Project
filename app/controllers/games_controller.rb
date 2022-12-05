class GamesController < ApplicationController
  def index
    @games = Game.where(won: :true)
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    game = Game.find(params[:id])
    game.update(game_params)
    redirect_to "/games/#{game.id}"
  end

  private
  
  def game_params
    params.permit(:name, :won, :number_of_moves)
  end
end