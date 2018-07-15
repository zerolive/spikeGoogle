require_relative '../lib/tokenizer'
require_relative '../api'
require 'rspec'
require 'json'
require 'jwt'

describe 'Login' do
  it 'returns a message with not allowed email error' do
    error = { 'error' => 'Email not allowed' }

    get '/api/login', { 'email' => 'not@alowed.com' }

    expect(response).to eq(error)
  end

  it 'returns a message with a token for a valid email' do
    email = 'allowed@email.com'
    token = Tokenizer.for(email)
    message = { 'token' => token }

    get '/api/login', { 'email' => email }

    expect(response).to eq(message)
  end
end
