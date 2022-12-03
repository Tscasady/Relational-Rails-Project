require 'rails_helper'

# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
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