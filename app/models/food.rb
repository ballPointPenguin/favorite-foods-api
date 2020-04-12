# frozen_string_literal: true

class Food < ApplicationRecord
  has_many :preferences
end
