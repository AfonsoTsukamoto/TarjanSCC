module TarjanSCC
  class Stack
    include Singleton
    class << self
      attr_accessor :indexes_array

      def initialize
        @indexes_array = []
      end

      def push(element)
        @indexes_array.push(element)
      end

      def pop
        @indexes_array.pop
      end

      def contains?(indice)
        @indexes_array.include?(indice)
      end

      def each_till_index(el, &block)
        raise "Block must be passed" if !block_given?
        @indexes_array.count.times do
          w = @indexes_array.pop
          block.call(w)
          return if w == el
        end
      end
    end
  end
end