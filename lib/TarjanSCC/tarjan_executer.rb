
module TarjanSCC

  @@index = 0
  @@scc_array = []
  def self.sccs
    @@scc_array
  end

  def self.execute(container=nil)
    VertArray.each_with_index do |vertix, index|
      if vertix.undefined?
        self.strong_connect(index, container)
      end
    end
    if container
      return container
    else
      puts "SCCS Array"
      puts @@scc_array.count
      return @@scc_array
    end
  end

  def self.strong_connect(ind, container=nil)
    vertix = VertArray[ind]
    vertix.index = @@index
    vertix.lowlink = @@index
    @@index = @@index + 1
    Stack.push(vertix)

    # Consider successors of v
    vertix.each_edge do |indice|
      if VertArray[indice].undefined?
        w = VertArray[indice]
        self.strong_connect(indice)
        vertix.lowlink = [vertix.lowlink, w.lowlink].min
      elsif Stack.contains?(indice)
        w = VertArray[indice]
        vertix.lowlink = [vertix.lowlink, w.index].min
      end
    end

    if vertix.is_root?
      scc = SCC.new
      Stack.each_till_index(ind) do |w|
        scc << w
      end
      if container
        container << scc
      else
        @@scc_array << scc
      end
    end
  end
end