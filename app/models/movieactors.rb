class MovieActors < ApplicationRecord

  belongs_to :movie
  belongs_to :actor
