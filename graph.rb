class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.name] = node
  end

  def add_neighbor(node_a, node_b)
    @nodes[node_a].add_neighbor(@nodes[node_b])
  end

  def [](name)
    @nodes[name]
  end
end
