module TarjanSCC
  class Stack
    require 'singleton'
    include Singleton
    class << self
      attr_accessor :indexes_array

      def indexes_array
        @@indexes_array ||= []
      end

      def push(element)
        self.indexes_array.push(element)
      end

      def pop
        self.indexes_array.pop
      end

      def contains?(indice)
        self.indexes_array.any?{ |vertix| vertix.position == indice }
      end

      def each_till_index(el, &block)
        raise "Block must be passed" if !block_given?
        self.indexes_array.count.times do
          w = self.pop
          block.call(w)
          break if w.position == el
        end
      end
    end
  end
end