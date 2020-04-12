# frozen_string_literal: true

class PersonResource < JSONAPI::Resource
  attributes :name
  has_many :preferences
end
