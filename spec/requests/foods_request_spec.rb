# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Foods Request', type: :request do
  it 'returns an empty collection when there are no foods' do
    get '/foods'

    expect(response).to have_http_status(:success)
    expect(response.content_type).to eq('application/json; charset=utf-8')

    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to be_an(Array)
    expect(parsed_response).to be_empty
  end

  it 'returns a collection of foods when there are foods' do
    Food.create(name: 'apples')
    Food.create(name: 'bananas')
    Food.create(name: 'chocolate')

    get '/foods'

    expect(response).to have_http_status(:success)
    expect(response.content_type).to eq('application/json; charset=utf-8')

    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to be_an(Array)
    expect(parsed_response.length).to eq(3)

    names = parsed_response.map { |item| item['name'] }
    expect(names)
      .to contain_exactly('apples', 'bananas', 'chocolate')
  end
end
