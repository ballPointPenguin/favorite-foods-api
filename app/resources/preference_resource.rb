# frozen_string_literal: true

class PreferenceResource < JSONAPI::Resource
  attributes :details
  has_one :food
  has_one :person
end
