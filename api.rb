require_relative './actions/authorize_email'
require_relative './actions/authorize_token'
require 'sinatra/base'
require 'json'

class Api < Sinatra::Base
  set :bind, '0.0.0.0'
  set :raise_errors, true
  set :show_exceptions, false

  get '/' do
    send_file 'index.html'
  end

  get '/api/login' do
    authorization = Actions::AuthorizeEmail.do(params['email'])

    authorization.to_json
  end

  get '/api/authorize' do
    authorization = Actions::AuthorizeToken.do(params['token'])

    authorization.to_json
  end
end
