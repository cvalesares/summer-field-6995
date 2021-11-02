class Actor < ApplicationRecord

  has_many :movieactors
  has_many :movies, through: :movieactors
