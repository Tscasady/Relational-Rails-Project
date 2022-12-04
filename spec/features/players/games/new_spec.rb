require "rails_helper"

RSpec.describe "the players' games' new page" do
  it 'can create a new game' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    
    visit "/players/#{player1.id}/games/new"

    fill_in('name', with: 'Tournament2Round3')
    expect(page).to have_field :won
    choose(:won, with: "true")
    fill_in('pieces', with: 'white')
    click_on('Create Game')
    
    game = Game.last
    expect(current_path).to eq("/players/#{player1.id}/games")
    expect(page).to have_content(game.id)
    expect(page).to have_content(game.won?)
    expect(page).to have_content(game.name)
    
  end
end