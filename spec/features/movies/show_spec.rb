require 'rails_helper'

RSpec.describe 'Movies Show' do
  before :each do
    @studio1 = Studio.create!(name: 'West End', location: 'San Francisco')
    @studio2 = Studio.create!(name: 'East End', location: 'New York')
    @prestige = @studio1.movies.create!(title: 'The Prestige', creation_year: 2002, genre: 'Suspense')
    @ib = @studio1.movies.create!(title: 'Inglorious Basterds', creation_year: 2014, genre: 'Action')
    @cw = @ib.actors.create!(name: 'Christoph Walt', age: 56)
    @bp = @ib.actors.create!(name: 'Brad Pitt', age: 48)
  end

  it 'shows a movie and its attributes' do
    visit "/movies/#{@prestige.id}"

    expect(page).to have_content(@prestige.title)
    expect(page).to have_content(@prestige.creation_year)
    expect(page).to have_content(@prestige.genre)

    visit "/movies/#{@ib.id}"

    expect(page).to have_content(@ib.title)
    expect(page).to have_content(@ib.creation_year)
    expect(page).to have_content(@ib.genre)
    expect(page).to have_content(@bp.name)
    expect(page).to have_content(@cw.name)
    expect(@cw.name).to appear_before(@bp.name)
  end
end

# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
