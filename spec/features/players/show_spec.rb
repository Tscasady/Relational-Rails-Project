require 'rails_helper'

RSpec.describe 'the players show page' do
  it 'displays a player and the players attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    player2 = Player.create!(name: 'Anthony', rating: 1100, professional: false)

    visit "/players/#{player1.id}"

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player1.rating)
    expect(page).to have_content(player1.professional)
    expect(page).to_not have_content(player2.name)
  end

  it 'displays the number of games a player has played' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    player2 = Player.create!(name: 'Anthony', rating: 1100, professional: false)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 43)
    game2 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 31)
    game3 = player2.games.create!(name: 'Tournament1Round1', won: false, number_of_moves: 21)

    visit "/players/#{player1.id}"

    expect(page).to have_content("Games Played: #{player1.games.count}")
  end

  it 'has a link to the players games' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    player2 = Player.create!(name: 'Anthony', rating: 1100, professional: false)
    visit "/players/#{player1.id}"
    expect(page).to have_link 'Games Played', href: "/players/#{player1.id}/games"
    visit "/players/#{player2.id}"
    expect(page).to have_link 'Games Played', href: "/players/#{player2.id}/games"
  end
  
  it 'has a link to update players' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    visit "/players/#{player1.id}"
    
    click_button "Update Player"

    expect(current_path).to eq "/players/#{player1.id}/edit"
  end

  it 'has a link that can delete a player' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    visit "/players/#{player1.id}"
    
    click_button "Delete Player"

    expect(current_path).to eq "/players"
    expect(page).to_not have_content(player1.name)
  end
end
