class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def create
    player = Player.new({
      name: params[:player][:name]
    })

    player.save
  end
  
  def show
    @player = player.find(params[:id])
  end
end