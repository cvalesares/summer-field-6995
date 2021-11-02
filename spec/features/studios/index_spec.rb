require 'rails_helper'

RSpec.describe 'Studio Index' do
  before :each do
    @studio1 = Studio.create!(name: 'West End', location: 'San Francisco')
    @studio2 = Studio.create!(name: 'East End', location: 'New York')
    @prestige = @studio1.movies.create!(title: 'The Prestige', creation_year: 2002, genre: 'Suspense')
  end
  it 'shows all studios and their attributes' do
    visit studios_path

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@prestige.title)
    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio2.location)
  end
end
