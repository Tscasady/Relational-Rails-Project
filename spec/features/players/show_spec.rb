require 'rails_helper'

RSpec.describe 'the players show page' do
  it 'displays a player and the players attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)

    visit "/players/#{player1.id}"

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player1.rating)
    expect(page).to have_content(player1.age)
    expect(page).to_not have_content(player2.name)
  end

  it 'displays the number of games a player has played' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)
    game1 = player1.games.create!(name: 'Tournament1Round1', won?: true, pieces: 'black')
    game2 = player1.games.create!(name: 'Tournament1Round2', won?: false, pieces: 'white')
    game3 = player2.games.create!(name: 'Tournament1Round1', won?: false, pieces: 'black')

    visit "/players/#{player1.id}"

    expect(page).to have_content("Games Played: #{player1.games.count}")
  end

  it 'has a link to the players games' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)
    visit "/players/#{player1.id}"
    expect(page).to have_link 'Games Played', href: "/players/#{player1.id}/games"
    visit "/players/#{player2.id}"
    expect(page).to have_link 'Games Played', href: "/players/#{player2.id}/games"
  end
  
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
  it 'has a link to update players' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)
    visit "/players/#{player1.id}"
    expect(page).to have_link 'Update Player', href: "/players/#{player1.id}/games"
    visit "/players/#{player2.id}"
    expect(page).to have_link 'Update Player', href: "/players/#{player2.id}/games"
  end
end
