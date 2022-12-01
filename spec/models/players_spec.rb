require 'rails_helper'

RSpec.describe Player do
  describe 'relationship' do
    it { should have_many :games}
  end

  describe '#ordered_games' do
    it 'orders all games by created_at in ascending order' do
      player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
      game1 = player1.games.create!(name: 'Tournament1Round1', created_at: Time.now-2.days, won?: true, pieces: 'black')
      game2 = player1.games.create!(name: 'Tournament1Round2', created_at: Time.now, won?: false, pieces: 'white')
      game3 = player1.games.create!(name: 'Tournament1Round3', created_at: Time.now-4.days, won?: true, pieces: 'black')

      expect(Player.ordered_games).to eq [game2, game3, game1]
    end
  end
end