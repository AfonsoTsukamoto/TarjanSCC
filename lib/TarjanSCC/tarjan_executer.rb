require 'scc'
require 'stack'
require 'vert_array'
require 'vertix'

module TarjanSCC
  @@index = 0
  @@scc_array = []

  def self.execute(container=nil)
    VertArray.each_with_index do |vertice, index|
      if vertice.undefined?
        self.strong_connect(index, container)
      end
    end
    container ? return container : return @@scc_array
    #for each vertice in Vertices do
    #if (v.index is undefined) then
    #  strongconnect(v)
    #end if
    #end for
  end

  def self.strong_connect(ind, container)
    # Set the depth index for vertice to the smallest unused index, vertice[index] = SMALL(index)
    vertix = VertArray[ind]
    vertix.index = Global.index
    vertix.lowlink = Global.index
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
      Stack.each_till_index(ind) do |indice|
        scc << indice
      end
      if container
        container << scc
      else
        @@scc_array << scc
      end
    end

    #for each (v, w) in Edges do
    #  if (w.index is undefined) then
    #    // Successor w has not yet been visited; recurse on it
    #    strongconnect(w)
    #    v.lowlink  = min(v.lowlink, w.lowlink)
    #  elsif (w is in Stack) then
    #    // Successor w is in stack S and hence in the current SCC
    #    v.lowlink  := min(v.lowlink, w.index)
    #  end if
    #end for
    #
    #// If v is a root node, pop the stack and generate an SCC
    #if (v.lowlink = v.index) then
    #  start a new strongly connected component
    #  repeat
    #    w := S.pop()
    #    add w to current strongly connected component
    #  until (w = v)
    #  output the current strongly connected component
    #end if
    #end function
  end
end