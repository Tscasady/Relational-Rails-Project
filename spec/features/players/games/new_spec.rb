require "rails_helper"

RSpec.describe "the players' games' new page" do
  it 'can create a new game' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    
    visit "/players/#{player1.id}/games/new"

    save_and_open_page
    fill_in('name', with: 'Tournament2Round3')
    choose(:won, option: true)
    fill_in('pieces', with: 'white')
    click_on('Create Game')

    new_game_id = Game.last.id
    expect(current_path).to eq("/players/#{player1.id}/games")
    expect(page).to have_content(new_game_id)
  end
end