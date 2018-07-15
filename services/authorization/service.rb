require_relative '../../lib/tokenizer'
require_relative './collection'

module Authorization
  class Service
    class << self
      INVALID_TOKEN = 'Invalid Token'
      NOT_ALLOWED = 'Email not allowed'

      def token_for(email)
        result = Collection.include?(email)
        return error(NOT_ALLOWED) unless result

        { 'token' => tokenize(email) }
      end

      def valid?(token)
        untokenize(token)
      rescue Tokenizer::InvalidToken
        error(INVALID_TOKEN)
      end

      private

      def tokenize(email)
        token = Tokenizer.for(email)
        token
      end

      def untokenize(token)
        email = Tokenizer.from(token)
        email
      end

      def error(message)
        { 'error' => message }
      end
    end
  end
end
