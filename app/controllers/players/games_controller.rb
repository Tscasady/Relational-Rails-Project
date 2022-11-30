class Players::GamesController < ApplicationController
  def index
    @player = Player.find(params[:id])
    @games = @player.games
  end
end
