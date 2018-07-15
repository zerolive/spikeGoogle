require 'rspec'

describe 'Authorized' do
  it 'returns a message with error for invalid token' do
    error = { 'error' => 'Invalid token' }

    get '/api/authorize', { 'token' => 'invalid.token' }

    expect(response).to eq(error)
  end
end
