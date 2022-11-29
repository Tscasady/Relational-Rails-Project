class AddPlayerToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :player, foreign_key: true
  end
end
