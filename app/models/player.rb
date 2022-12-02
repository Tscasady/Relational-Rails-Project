class Player < ApplicationRecord
  has_many :games

  def self.ordered
    self.order(created_at: :DESC)
  end
end