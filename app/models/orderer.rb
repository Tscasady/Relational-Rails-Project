module Orderer

  def self.ordered_games(player, sort)
    self.for(player, sort).games
  end

  def self.for(player, sort)
    case sort
    when nil
      DefaultOrder.new(player, sort)
    when "alpha"
      AlphaOrder.new(player, sort)
    else
      ColumnOrder.new(player, sort)
    end
  end

  class DefaultOrder
    def initialize(player, sort)
      @player = player
    end
    def games
      @player.games.where(won: :true)
    end
  end

  class AlphaOrder
    def initialize(player, sort)
      @player = player
    end

    def games
      @player.games.order(:name)
    end
  end
  
  #create nested factories / inheritance structure?
  class ColumnOrder
    def initialize(player, sort)
      @player = player
      @sort = sort
    end

    def games
      @player.games.where("number_of_moves > #{@sort}")
    end
  end
end