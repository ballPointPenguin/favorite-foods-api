# frozen_string_literal: true

class Preference < ApplicationRecord
  belongs_to :person
  belongs_to :food
end
