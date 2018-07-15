require_relative '../services/authorization/service'

module Actions
  class AuthorizeEmail
    def self.do(email)
      token = Authorization::Service.token_for(email)

      token
    end
  end
end
