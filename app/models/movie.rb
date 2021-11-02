class Movie < ApplicationRecord
  belongs_to :studio

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actor_sort
    actors.order(:age)
  end

  def avg_age
    self.actors.average(:age)
  end
end
