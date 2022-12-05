require 'rails_helper'

RSpec.describe 'the games index page' do
  it 'displays all won games and their attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    player2 = Player.create!(name: 'Anthony', rating: 1100, professional: false)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 24)
    game2 = player1.games.create!(name: 'Tournament1Round2', won: false, number_of_moves: 21)
    game3 = player2.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 29)
    
    visit '/games'

    expect(page).to have_content(game1.name)
    expect(page).to_not have_content(game2.name)
    expect(page).to have_content(game3.name)
    expect(page).to have_content(game1.won)
    expect(page).to_not have_content(game2.number_of_moves)
    expect(page).to have_content(game3.player_id)
    expect(page).to_not have_content(false)
    
  end

  it 'has a link to a game show page' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 24)
    game2 = player1.games.create!(name: 'Tournament1Round2', won: false, number_of_moves: 21)

    visit "/games"

    expect(page).to have_link "Game Details", href: "/games/#{game1.id}"
    expect(page).to_not have_link "Game Details", href: "/games/#{game2.id}"
  end
end