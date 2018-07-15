require_relative './collection'

module Authorization
  class Service
    def self.token_for(email)
      result = Collection.include?(email)
      return { 'error' => 'Email not allowed' } unless result

      {}
    end
  end
end
