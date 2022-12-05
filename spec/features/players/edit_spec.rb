require "rails_helper"

RSpec.describe 'it can update a Players info' do
  it 'has a form where the user can update Player attributes' do
    player1 = Player.create!(name: 'Magnus', rating: 3000, age: 32)

    visit "/players/#{player1.id}"
    expect(page).to have_content "Magnus"

    visit "/players/#{player1.id}/edit"

    fill_in("Name", with: "Wesley So")
    fill_in("rating", with: 2900)
    fill_in("Age", with: 29)
    click_on("Submit")
    
    expect(current_path).to eq "/players/#{player1.id}"
    expect(page).to have_content "Wesley So"
    expect(page).to have_content "rating: 2900"
    expect(page).to have_content "age: 29"
    
  end
end