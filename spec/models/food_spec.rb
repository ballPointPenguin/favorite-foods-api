# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'can be created with just a name' do
    Food.create(name: 'ravioli')

    expect(Food.count).to eq(1)
  end
end
