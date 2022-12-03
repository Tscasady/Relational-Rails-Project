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

  def create
    Player.create(player_params)
    redirect_to '/players'    
  end

  private

  def player_params
    params.permit(:name, :rating, :age)
  end
end