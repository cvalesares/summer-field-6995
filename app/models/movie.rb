class Movie < ApplicationRecord
  belongs_to :studio

  has_many :movieactors
  has_many :actors, through: :movieactors
end
