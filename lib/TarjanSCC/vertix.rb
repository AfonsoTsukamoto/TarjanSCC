module TarjanSCC
  class Vertix
    attr_accessor :lowlink, :index, :edges
    def initialize
      @edges = []
      @lowlink = nil
      @index = nil
      self # allow chained methods
    end

    def undefined?
      index == nil
    end

    def is_root?
      @lowlink == @index && @lowlink != nil && @index != nil
    end

    def print
      puts "lowlink: #{@lowlink}"
      puts "index:   #{@index}"
      puts ""
    end

    def <<(val)
      @edges << val -1
    end

    def each_edge(&block)
      raise "Block must be passed" if !block_given?

      @edges.each do |edge|
        block.call(edge)
      end
    end
  end
end