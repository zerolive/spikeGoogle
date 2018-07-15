require_relative '../api'
require 'rack/test'
require 'rspec'
require 'json'

describe 'Login' do
  include Rack::Test::Methods

  def app
    Api
  end

  it 'returns not allowed email error' do
    error = { 'error' => 'Email not allowed' }

    get '/api/login', { 'email' => 'not@alowed.com' }

    expect(response).to eq(error)
  end

  def response
    body = last_response.body

    JSON.parse(body)
  end
end
