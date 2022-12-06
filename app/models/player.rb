class Player < ApplicationRecord
  has_many :games

  def self.ordered
    self.order(created_at: :DESC)
  end

  def game_count
    Game.where(player_id: self.id).count
  end

  def ordered_games(sort)
    if sort.nil?
      self.games.where(won: :true)
    elsif sort == "alpha"
      games.order(:name)
    end
  end
end