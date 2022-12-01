require 'rails_helper'

RSpec.describe 'the games index page' do
  it 'displays all games and their attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)
    game1 = player1.games.create!(name: 'Tournament1Round1', won?: true, pieces: 'black')
    game2 = player1.games.create!(name: 'Tournament1Round2', won?: false, pieces: 'white')
    game3 = player2.games.create!(name: 'Tournament1Round1', won?: true, pieces: 'black')
    
    visit '/games'

    save_and_open_page

    expect(page).to have_content(game1.name)
    expect(page).to have_content(game2.name)
    expect(page).to have_content(game3.name)
    expect(page).to have_content(game1.won?)
    expect(page).to have_content(game2.pieces)
    expect(page).to have_content(game3.player_id)
  end
end