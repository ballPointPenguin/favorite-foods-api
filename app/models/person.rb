# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :preferences
end
