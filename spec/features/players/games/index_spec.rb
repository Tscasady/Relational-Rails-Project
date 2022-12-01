require 'rails_helper'

RSpec.describe "the players' games index page" do
  it 'displays a player and the players games' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)
    game1 = player1.games.create!(name: 'Tournament1Round1', won?: true, pieces: 'black')
    game2 = player1.games.create!(name: 'Tournament1Round2', won?: false, pieces: 'white')
    game3 = player2.games.create!(name: 'Tournament1Round1', won?: false, pieces: 'black')
    
    visit "/players/#{player1.id}/games"

    expect(page).to have_content(game1.name)
    expect(page).to have_content(game1.won?)
    expect(page).to have_content(game2.name)
    expect(page).to_not have_content(game3.id)
  end
end
