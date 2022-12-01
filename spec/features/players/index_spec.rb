require 'rails_helper'

RSpec.describe 'the players index page' do
  it 'displays all players via their names' do
    player1 = Player.create!(name: 'Magnus')
    player2 = Player.create!(name: 'Anthony')

    visit '/players'

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player2.name)
  end
end