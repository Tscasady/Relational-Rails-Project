require 'rails_helper'

RSpec.describe 'the navigation bar' do
  it 'can direct a user to the /games page' do
    visit '/'
    expect(page).to have_link 'Games', href: '/games'
    visit '/players'
    expect(page).to have_link 'Games', href: '/games'
  end
  it 'can direct a user to the /players page' do
    visit '/'
    expect(page).to have_link 'Players', href: '/players'
    visit '/games'
    expect(page).to have_link 'Players', href: '/players'
  end
end