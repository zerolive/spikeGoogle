require_relative '../services/authorization/service'

module Actions
  class AuthorizeToken
    class << self
      def do(token)
        message = Authorization::Service.validate(token)

        message
      end
    end
  end
end
