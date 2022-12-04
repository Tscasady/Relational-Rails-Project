require "rails_helper"

RSpec.describe "the players' games' new page" do
  it 'can create a new game' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    
    visit "/players/#{player1.id}/games/new"

    fill_in('Name', with: 'Tournament2Round3')
    fill_in('won?', with: true)
    fill_in('pieces', with: 'white')
    click_on('Create Game')

    new_game_id = Game.last.id
    expect(current_path).to eq("/players/#{player1.id}/games")
    expect(page).to have_content(new_game_id)
  end
end