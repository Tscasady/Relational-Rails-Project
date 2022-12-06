require 'rails_helper'

RSpec.describe 'the games show page' do
  it 'displays a game and its attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 31)
    game2 = player1.games.create!(name: 'Tournament1Round2', won: false, number_of_moves: 17)
    
    visit "/games/#{game1.id}"

    expect(page).to have_content(game1.name)
    expect(page).to have_content(game1.won)
    expect(page).to_not have_content(game2.name)
 
  end

  it 'has an update game button' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 43)
    game2 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 31)

    visit "/games/#{game1.id}"

    click_button "Update Game"

    expect(current_path).to eq("/games/#{game1.id}/edit")
  end
  
  it 'has a link that can delete a game' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 43)
    game2 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 31)
    
    visit "/players/#{player1.id}"
    
    click_button "Delete Player"

    expect(current_path).to eq "/players"
    expect(page).to_not have_content(game1.name)
    expect(page).to have_content(game2.name)
  end
end