require_relative './actions/authorize_email'
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
end
