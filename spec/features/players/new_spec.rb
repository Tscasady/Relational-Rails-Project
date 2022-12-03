require 'rails_helper'

RSpec.describe 'the player new page' do
  it 'can create a new player' do
     visit 'players/new'

     fill_in('Name', with: 'Judit')
     click_on('Create Player')

     new_player_id = Player.last.id
     expect(current_path).to eq("/players")
     expect(page).to have_content("Judit")
  end
end