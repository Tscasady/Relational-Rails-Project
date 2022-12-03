class PlayersController < ApplicationController
  def index
    @players = Player.all
  end
  
  def show
    @player = Player.find(params[:id])
    @count = @player.game_count
  end

  def new
    
  end
end