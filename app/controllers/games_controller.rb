class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    game = Game.new({
      name: params[:game][:name]
    })

    game.save
  end
  
  def show
    @game = Game.find(params[:id])
  end
end