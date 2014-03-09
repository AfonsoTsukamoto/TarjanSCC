module TarjanSCC
  class VertArray
    include Singleton

    class << self
      attr_accessor :array, :dim

      # Here, dim is |V| in G = (V,E)
      def set_dim(dim)
        @dim = dim
        @array = []
      end

      def each_with_index(&block)
        raise 'Missing block!' if !block_given?
        @array.each_with_index do |vertix, index|
          block.call(vertix, index)
        end
      end

      def [](ind)
        raise 'Out of bounds!' if out_of_bounds?(ind)
        @array[ind]
      end

      def []=(ind, val)
        raise 'Out of bounds!' if out_of_bounds?(ind)
        @array[ind] = val
      end

      private

      def out_of_bounds?(ind)
        ind > (dim - 1) || ind < 0
      end
    end
  end
end