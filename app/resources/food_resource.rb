# frozen_string_literal: true

class FoodResource < JSONAPI::Resource
  attributes :name
  has_many :preferences
end
