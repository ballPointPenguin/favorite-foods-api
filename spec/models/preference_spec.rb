# frozen_string_literal: true

require "rails_helper"

RSpec.describe Preference, type: :model do
  let(:alice) { Person.create(name: "Alice") }
  let(:wheat) { Food.create(name: "wheat") }

  it "associates with one food and one person" do
    Preference.create(food: wheat, person: alice)

    expect(alice.preferences.count).to eq(1)
    expect(wheat.preferences.count).to eq(1)
    expect(alice.preferences.first.food).to eql(wheat)
  end

  it "can include arbitrary details" do
    Preference.create(food: wheat, person: alice, details: { is_alergic: true })

    expect(alice.preferences.first.details).to eq({ "is_alergic" => true })
  end
end
