require "rails_helper"

RSpec.describe 'the games edit page' do
  it 'can edit an existing games attribute' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    game1 = player1.games.create!(name: 'Tournament1Round1', won?: true, pieces: 'black')

    visit "/games/#{game1.id}"
    expect(page).to have_content "Tournament1Round1"

    visit "/games/#{game1.id}/edit"
    fill_in("Name", with: "Round3")
    choose(:won, with: "true")
    fill_in("pieces", with: "white")
    click_on("Submit")

    
    expect(current_path).to eq "/games/#{game1.id}"
    expect(page).to have_content(game1.name)
    expect(page).to have_content(game1.won?)
    expect(page).to have_content(game1.pieces)
  end
end