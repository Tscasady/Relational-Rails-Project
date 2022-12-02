class Player < ApplicationRecord
  has_many :games

  def self.ordered
    self.order(created_at: :DESC)
  end

  def game_count
    Game.where(player_id: self.id).count
  end
end