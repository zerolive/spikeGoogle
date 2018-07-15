require_relative '../lib/tokenizer'
require 'rspec'

describe 'Authorized' do
  it 'returns a message with error for invalid token' do
    error = { 'error' => 'Invalid token' }

    get '/api/authorize', { 'token' => 1123123 }

    expect(response).to eq(error)
  end

  it 'returns a message with authorized token for a valid token' do
    authorized = { 'message' => 'Valid token' }
    valid_token = Tokenizer.for({ 'email' => 'allowed@email.com' })

    get '/api/authorize', { 'token' => valid_token }

    expect(response).to eq(authorized)
  end

  it 'returns an error for a valid token with not allowed email' do
    unauthorized = { 'error' => 'Email not allowed' }
    invalid_email = Tokenizer.for({ 'email' => 'not@allowed.com' })

    get '/api/authorize', { 'token' => invalid_email }

    expect(response).to eq(unauthorized)
  end
end
