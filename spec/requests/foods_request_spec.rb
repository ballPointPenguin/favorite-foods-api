# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Foods Request", type: :request do
  it "returns an empty collection when there are no foods" do
    get "/foods"

    expect(response).to have_http_status(:success)
    expect(response.content_type).to eq("application/vnd.api+json")

    response_hash = JSON.parse(response.body).deep_symbolize_keys
    expect(response_hash).to be_a(Hash)
    expect(response_hash).to have_key(:data)
    expect(response_hash[:data]).to be_empty
  end

  it "returns a collection of foods when there are foods" do
    create_list(:food, 3)

    get "/foods"

    expect(response).to have_http_status(:success)
    expect(response.content_type).to eq("application/vnd.api+json")

    response_hash = JSON.parse(response.body).deep_symbolize_keys
    expect(response_hash).to be_a(Hash)
    expect(response_hash).to have_key(:data)
    expect(response_hash[:data].length).to eq(3)
    expect(response_hash).to_not have_key(:errors)

    attrs = response_hash[:data].map { |item| item[:attributes][:name] }
    expect(attrs).to contain_exactly(*Food.all.map(&:name))

    ids = response_hash[:data].map { |item| item[:id].to_i }
    expect(ids).to contain_exactly(*Food.all.map(&:id))
  end
end
