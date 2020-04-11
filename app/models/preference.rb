class Preference < ApplicationRecord
  belongs_to :person
  belongs_to :food
end
