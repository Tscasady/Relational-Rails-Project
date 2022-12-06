require 'rails_helper'

RSpec.describe "the players' games index page" do
  it 'displays a player and the players games' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    player2 = Player.create!(name: 'Anthony', rating: 1100, professional: false)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 43)
    game2 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 31)
    game3 = player2.games.create!(name: 'Tournament1Round1', won: false, number_of_moves: 21)
    
    visit "/players/#{player1.id}/games"

    expect(page).to have_content(game1.name)
    expect(page).to have_content(game1.won)
    expect(page).to have_content(game2.name)
    expect(page).to_not have_content(game3.id)
  end

  it 'has a button to create a new game' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    
    visit "/players/#{player1.id}/games"
    click_button "Create Game"
    
    expect(current_path).to eq "/players/#{player1.id}/games/new"
  end

  it 'has a link to sort the game in alphabetical order' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)

    visit "/players/#{player1.id}/games"

    expect(page).to have_link 'Sort Alphabetically', href: "/players/#{player1.id}/games?sort=alpha"
  end

  it 'displays games in alphabetical order when the link is pressed' do
    player1 = Player.create!(name: 'Magnus', created_at: Time.now-4.days, rating: 3000, professional: true)
    game1 = player1.games.create(name: "Sinquefield Cup Round 1", won: true, number_of_moves: rand(10..80), player: player1)
    game2 = player1.games.create(name: "Grand Prix 2022", won: true, number_of_moves: rand(10..80), player: player1)

    visit "/players/#{player1.id}/games"
    save_and_open_page
    click_link 'Sort Alphabetically'

    expect(game2.name).to appear_before (game1.name) 
  end
end
