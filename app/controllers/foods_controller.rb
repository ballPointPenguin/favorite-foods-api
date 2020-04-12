# frozen_string_literal: true

class FoodsController < ApplicationController
  def index
    render json: Food.all
  end
end
