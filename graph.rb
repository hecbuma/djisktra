class Graph
  attr_accessor :nodes, :routes

  def initialize
    @nodes = {}
    @routes = []
  end

  def add_node(node)
    @nodes[node.name] = node
  end

  def add_route(node_a, node_b, distance)
   @nodes[node_a].add_neighbor(@nodes[node_b])
   @routes << [@nodes[node_a], @nodes[node_b], distance]
   # @nodes[node_b].add_neighbor(@nodes[node_a])
  end

  def [](name)
    @nodes[name]
  end

end
