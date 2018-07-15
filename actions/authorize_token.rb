require_relative '../services/authorization/service'

module Actions
  class AuthorizeToken
    class << self
      def do(token)
        message = Authorization::Service.valid?(token)
        message = { 'error' => 'Invalid token' }

        message
      end
    end
  end
end
