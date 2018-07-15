require 'jwt'

class Tokenizer
  class InvalidToken < StandardError; end

  class << self
    ALGORITHM = 'HS256'
    VERIFY = true

    def for(message)
      JWT.encode(message, ENV['SECRET'], ALGORITHM)
    end

    def from(token)
      JWT.decode(token, ENV['SECRET'], VERIFY, { algorithm: ALGORITHM })
    rescue JWT::DecodeError
      raise InvalidToken
    end
  end
end
