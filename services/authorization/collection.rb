
module Authorization
  class Collection
    class << self
      def include?(email)
        list.include?(email)
      end

      private

      def list
        []
      end
    end
  end
end
