require 'rails_helper'

RSpec.describe 'the players show page' do
  it 'displays a player and the players attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)
    player2 = Player.create!(name: 'Anthony', rating: 1100, age: 38)

    visit "/players/#{player1.id}"

    save_and_open_page

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player1.rating)
    expect(page).to have_content(player1.age)
    expect(page).to_not have_content(player2.name)
  end
end