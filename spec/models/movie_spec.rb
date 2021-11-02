require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many :movie_actors }
    it { should have_many :actors }
  end

  describe 'methods' do
    it 'should sort actors by age' do
      studio1 = Studio.create!(name: 'West End', location: 'San Francisco')
      studio2 = Studio.create!(name: 'East End', location: 'New York')
      ib = studio1.movies.create!(title: 'Inglorious Basterds', creation_year: 2014, genre: 'Action')
      prestige = studio1.movies.create!(title: 'The Prestige', creation_year: 2002, genre: 'Suspense')
      cb = prestige.actors.create!(name: 'Christian Bales', age: 44)
      hj = prestige.actors.create!(name: 'Hugh Jackman', age: 62)
      cw = ib.actors.create!(name: 'Christoph Walt', age: 56)
      bp = ib.actors.create!(name: 'Brad Pitt', age: 48)

      expect(ib.actor_sort).to eq([bp, cw])
      expect(prestige.actor_sort).to eq([cb, hj])
    end

    it 'should find the average age of actors' do
      studio1 = Studio.create!(name: 'West End', location: 'San Francisco')
      studio2 = Studio.create!(name: 'East End', location: 'New York')
      ib = studio1.movies.create!(title: 'Inglorious Basterds', creation_year: 2014, genre: 'Action')
      prestige = studio1.movies.create!(title: 'The Prestige', creation_year: 2002, genre: 'Suspense')
      cb = prestige.actors.create!(name: 'Christian Bales', age: 44)
      hj = prestige.actors.create!(name: 'Hugh Jackman', age: 62)
      cw = ib.actors.create!(name: 'Christoph Walt', age: 56)
      bp = ib.actors.create!(name: 'Brad Pitt', age: 48)

      expect(prestige.avg_age).to eq(53)
      expect(ib.avg_age).to eq(52)
    end
  end
end
