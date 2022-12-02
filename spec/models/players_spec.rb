require 'rails_helper'

RSpec.describe Player do
  describe 'relationship' do
    it { should have_many :games}
  end

  describe '#ordered' do
    it 'orders all games by created_at in ascending order' do
      player1 = Player.create!(name: 'Magnus', created_at: Time.now-4.days, rating: 3000, age: 32)
      player2 = Player.create!(name: 'Anthony', created_at: Time.now, rating: 1100, age: 38)
      player3 = Player.create!(name: 'Judit', created_at: Time.now-2.days, rating: 2700, age: 46)
      expect(Player.ordered).to eq [player2, player3, player1]
    end
  end
end