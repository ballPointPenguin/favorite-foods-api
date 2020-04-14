# frozen_string_literal: true

require "rails_helper"

RSpec.describe Person, type: :model do
  it "can be created with just a name" do
    Person.create(name: "Alonzo")

    expect(Person.count).to eq(1)
  end
end
