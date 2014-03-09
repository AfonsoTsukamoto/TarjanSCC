module TarjanSCC
  class SCC
    attr_accessor :array
    def initialize
      @array = []
      self # Allow chained methods
    end

    def <<(val)
      #raise 'Bad format!' if val.class.to_s != 'Vertix'
      @array << val
    end

    def print
      @array.each do |vertix|
        vertix.print rescue 'Bad format!'
      end
    end
  end
end