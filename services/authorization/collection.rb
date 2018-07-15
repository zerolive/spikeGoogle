
module Authorization
  class Collection
    class << self
      def include?(email)
        list.include?(email)
      end

      private

      def list
        ['allowed@email.com']
      end
    end
  end
end
