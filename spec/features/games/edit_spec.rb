require "rails_helper"

RSpec.describe 'the games edit page' do
  it 'can edit an existing games attribute' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, professional: true)
    game1 = player1.games.create!(name: 'Tournament1Round1', won: true, number_of_moves: 43)

    visit "/games/#{game1.id}"
    expect(page).to have_content "Tournament1Round1"

    visit "/games/#{game1.id}/edit"
    fill_in("Name", with: "Round3")
    choose(:won, with: "true")
    fill_in(:number_of_moves, with: 22)
    click_on("Submit")

    
    expect(current_path).to eq "/games/#{game1.id}"
    expect(page).to have_content "Round3"
    expect(page).to have_content "true" 
    expect(page).to have_content 22
  end
end