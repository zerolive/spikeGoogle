require_relative '../../lib/tokenizer'
require_relative './collection'

module Authorization
  class Service
    class << self
      INVALID_TOKEN = 'Invalid token'
      NOT_ALLOWED = 'Email not allowed'
      VALID_TOKEN = 'Valid token'

      def token_for(email)
        result = Collection.include?(email)
        return error(NOT_ALLOWED) unless result

        { 'token' => tokenize(email) }
      end

      def validate(token)
        message = untokenize(token)
        result = Collection.include?(message['email'])
        return error(NOT_ALLOWED) unless result

        { 'message' => VALID_TOKEN }
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
        email.first
      end

      def error(message)
        { 'error' => message }
      end
    end
  end
end
