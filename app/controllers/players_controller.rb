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

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    redirect_to "/players/#{player.id}"
  end

  private

  def player_params
    params.permit(:name, :rating, :professional)
  end
end