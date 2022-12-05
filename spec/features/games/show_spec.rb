require 'rails_helper'

RSpec.describe 'the games show page' do
  it 'displays a game and its attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    game1 = player1.games.create!(name: 'Tournament1Round1', won?: true, pieces: 'black')
    game2 = player1.games.create!(name: 'Tournament1Round2', won?: false, pieces: 'white')
    
    visit "/games/#{game1.id}"

    expect(page).to have_content(game1.name)
    expect(page).to have_content(game1.won?)
    expect(page).to_not have_content(game2.name)
 
  end

  it 'has an update game button' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    game1 = player1.games.create!(name: 'Tournament1Round1', won?: true, pieces: 'black')
    game2 = player1.games.create!(name: 'Tournament1Round2', won?: false, pieces: 'white')

    visit "/games/#{game1.id}"

    click_button "Update Game"

    expect(current_path).to eq("/games/#{game1.id}/edit")
  end
end