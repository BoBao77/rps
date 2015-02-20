require 'rails_helper'

RSpec.describe '.play', type: :request do
  it 'Throws rock at server via html' do
    post '/throw', sign: 'rock'

    expect(response.body).to include('id="results"')
    expect(response.body).to include('You threw rock')
    expect(response.response_code).to eq 200
  end

  it 'Throws rps move at server with content-type json' do
    %w(rock paper scissors).each do |throw|
      json = { format: 'json', sign: throw }
      post '/throw', json

      expect(response.response_code).to eq 200
      response_throw = JSON.parse(response.body)['throw']
      cpu_throw = JSON.parse(response.body)['cpu_throw']
      @results = Game.new(response_throw, cpu_throw: cpu_throw).results
      expect(@results.as_json).to eq(JSON.parse(response.body))
    end
  end
end
