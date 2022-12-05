require 'rails_helper'

RSpec.describe Player do
  describe 'relationship' do
    it { should have_many :games}
  end

  describe '#ordered' do
    it 'orders all games by created_at in ascending order' do
      player1 = Player.create!(name: 'Magnus', created_at: Time.now-4.days, rating: 3000, professional: true)
      player2 = Player.create!(name: 'Anthony', created_at: Time.now, rating: 1100, professional: false)
      player3 = Player.create!(name: 'Judit', created_at: Time.now-2.days, rating: 2700, professional: true)
      expect(Player.ordered).to eq [player2, player3, player1]
    end
  end

  describe '#game_count' do
    it 'returns the number of games played by the player' do
      player1 = Player.create!(name: 'Magnus', created_at: Time.now-4.days, rating: 3000, professional: true)
      player2 = Player.create!(name: 'Anthony', created_at: Time.now, rating: 1100, professional: false)
      game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 24)
      game2 = player1.games.create!(name: 'Tournament1Round2', won: false, number_of_moves: 21)
      game3 = player2.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 29)

      expect(player1.game_count).to eq 2
      expect(player2.game_count).to eq 1
    end
  end
end