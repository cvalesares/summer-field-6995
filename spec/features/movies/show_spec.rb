require 'rails_helper'

RSpec.describe 'Movies Show' do
  before :each do
    @studio1 = Studio.create!(name: 'West End', location: 'San Francisco')
    @studio2 = Studio.create!(name: 'East End', location: 'New York')
    @ib = @studio1.movies.create!(title: 'Inglorious Basterds', creation_year: 2014, genre: 'Action')
    @prestige = @studio1.movies.create!(title: 'The Prestige', creation_year: 2002, genre: 'Suspense')
    @cb = @prestige.actors.create!(name: 'Christian Bales', age: 44)
    @hj = @prestige.actors.create!(name: 'Hugh Jackman', age: 62)
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
  end

  it 'can sort actors by name' do
    visit "/movies/#{@ib.id}"

    expect(@bp.name).to appear_before(@cw.name)
  end

  it 'can find the average age of all actors' do
    visit "/movies/#{@ib.id}"

    expect(page).to have_content(52)
  end

  it 'can add actors through form' do
    visit "/movies/#{@ib.id}"

    fill_in("name", with: "Scarlett Johansson")
    fill_in("age", with: "42")
    click_button "Add Actor"

    expect(current_path).to eq("/movies/#{@ib.id}")
    expect(page).to have_content("Scarlett Johansson")
  end
end

# Story 3
# Add an Actor to a Movie
#
# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the name submitted is not an existing actor)
