require 'rails_helper'

RSpec.describe 'the players index page' do
  it 'displays all players via their names' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)

    visit '/players'

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player2.name)
  end

  it 'has a link to go to /parents/new' do
    visit '/players'

    expect(page).to have_link 'New Player', href: '/players/new'
  end

  it 'has links to individual player show pages' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)

    visit '/players'

    expect(page).to have_link "#{player1.name}", href: "/players/#{player1.id}"
    expect(page).to have_link "#{player2.name}", href: "/players/#{player2.id}"
  end
end